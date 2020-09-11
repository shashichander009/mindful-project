from django.shortcuts import render
from django.http import JsonResponse
from .serializers import LoginSerializer
from rest_framework.views import APIView
from django.contrib.auth import login as django_login, logout as django_logout
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny

# Create your views here.


class HelloWorld(APIView):
    """
    API Documentation testing Hello World
    """

    permission_classes = (AllowAny, )

    def get(self, request, format=None):

        respose = "Hello World"

        return JsonResponse(respose, safe=False)


class HelloWorld2(APIView):
    """
    API Documentation testing Hello World 2
    """

    def get(self, request, format=None):

        respose = "Hello World from SECOND CLASS"

        return JsonResponse(respose, safe=False)


class LoginView(APIView):
    def post(self, request):
        serializer = LoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data["user"]
        # django_login(request, user)
        # token =
        # token, created = Token.objects.get_or_create(user=user)
        # return Response({"token": token.key}, status=200)
        return Response({"token": "token"}, status=200)


class LogoutView(APIView):
    def post(self, request):
        django_logout(request)
        return Response(status=204)
