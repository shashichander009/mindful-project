from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth import login as django_login, logout as django_logout
from django.shortcuts import get_object_or_404

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.authtoken.models import Token
from rest_framework.response import Response
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework_swagger import renderers
from rest_framework.schemas import SchemaGenerator
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

from .serializers import (
    LoginSerializer, 
    UserSerializer, 
    PostSerializer,
)
from .models import (
    User, 
    Post,
)

# Create your views here.


class HelloWorld(APIView):
    """
    API Documentation testing Hello World
    """

    permission_classes = (IsAuthenticated, )

    def get(self, request, format=None):

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


class UserView(APIView):

    def get(self, request):
        data = {}
        requestdict = dict(request.GET)

        if "username" in requestdict:
            username = request.GET["username"]
            user = User.objects.filter(username=username)
            reqtype = "username"

        elif "email" in requestdict:
            email = request.GET["email"]
            user = User.objects.filter(email=email)
            reqtype = "email"

        else:
            data['response'] = "No/Bad Parameters"
            status = 404
            return Response(data, status)

        if not user:
            data['response'] = reqtype + " available "
            status = 200
        else:
            data['response'] = reqtype + " already taken"
            status = 404

        return Response(data, status)

    def post(self, request):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid():
            print(user_serializer)
            user_serializer.save()
            return JsonResponse(user_serializer.data,status=status.HTTP_201_CREATED)
        return JsonResponse(user_serializer.errors, status=status.HTTP_400_BAD_REQUEST)



def get_user_from_jwt(self, request):

    header = JWTAuthentication.get_header(self, request=request)
    raw_token = JWTAuthentication.get_raw_token(self, header=header)
    val_token = JWTAuthentication.get_validated_token(self, raw_token=raw_token)
    user = JWTAuthentication.get_user(self, validated_token=val_token)

    return user


class PostView(APIView):

    permission_classes = (IsAuthenticated, )

    def get(self, request):
        posts = Post.objects.all()
        post_serializer = PostSerializer(posts, many=True)
        return JsonResponse(post_serializer.data, safe=False)


    def post(self, request):
        user = get_user_from_jwt(self, request)
        post_serializer = PostSerializer(data=request.data, context={"user": user})
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"response": "Post Created"}, status=201)
        return JsonResponse(post_serializer.errors, status=400)


class SinglePostView(APIView):

    permission_classes = (IsAuthenticated, )

    def get(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)
        post_serializer = PostSerializer(post)
        return JsonResponse(post_serializer.data, status=200)


    def patch(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)
        post_serializer = PostSerializer(post, data=request.data, partial=True)
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"response": "Post Updated"}, status=200)
        return JsonResponse(post_serializer.errors, status=400)


    def delete(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)
        post.delete()
        return JsonResponse({"response": "Post Deleted"}, status=200)    
