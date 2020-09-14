from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth import login as django_login, logout as django_logout

from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_swagger import renderers
from rest_framework.schemas import SchemaGenerator
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from .serializers import LoginSerializer, UserSerializer
from .models import User

# Create your views here.


class HelloWorld(APIView):
    """
    API Documentation testing Hello World
    """

    permission_classes = (IsAuthenticated, )

    def get(self, request, format=None):

        # header = JWTAuthentication.get_header(self, request=request)
        # raw_token = JWTAuthentication.get_raw_token(self, header=header)
        # val_token = JWTAuthentication.get_validated_token(self, raw_token=raw_token)
        # user = JWTAuthentication.get_user(self, validated_token=val_token)
        # print(user.user_id)

        respose = "Hello World"

        return JsonResponse(respose, safe=False)


class LoginView(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data["user"]
        django_login(request, user)

        jwt = TokenObtainPairSerializer.get_token(user=user)

        token = {
            'refresh': str(jwt), 
            'access': str(jwt.access_token)
        }

        return JsonResponse({"token": token}, status=200)


class LogoutView(APIView):

    permission_classes = (IsAuthenticated, )

    def post(self, request):
        django_logout(request)
        return Response(status=204)


class SignupView(APIView):

    def post(self, request):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid():
            user_serializer.save()
            return JsonResponse(user_serializer.data)
        return JsonResponse(user_serializer.errors, status=400)

    def get(self, request):
        users = User.objects.all()
        user_serializer = UserSerializer(users, many=True)
        return JsonResponse(user_serializer.data, safe=False)


class UserView(APIView):

    def get(self, request):
        requestdict = dict(request.GET)
        if "username" in requestdict:
            username = request.GET["username"]
            user = User.objects.filter(username=username)
            reqtype = "username"
        if "email" in requestdict:
            email = request.GET["email"]
            user = User.objects.filter(email=email)
            reqtype = "email"
        data = {}
        if not user:
            data['response'] = reqtype + " available "
            status = 200
        else:
            data['response'] = reqtype + " already taken"
            status = 404
        return Response(data, status)
