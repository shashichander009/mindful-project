from django.http import JsonResponse
from django.contrib.auth import (
    login as django_login,
    logout as django_logout
)
from django.shortcuts import get_object_or_404
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
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

        return JsonResponse(token, status=status.HTTP_200_OK)


class LogoutView(APIView):

    permission_classes = (IsAuthenticated, )

    def post(self, request):
        django_logout(request)
        return Response(status=204)


class UserView(APIView):

    def get(self, request):
        request_data = request.GET

        if 'username' in request_data:
            user = User.objects.filter(username=request_data.get('username', ''))

        if 'email' in request_data:
            user = User.objects.filter(email=request_data.get('email', ''))

        if user:
            return JsonResponse({"detail": "Already Used"},
                            status=status.HTTP_226_IM_USED)
        return JsonResponse({"detail": "Available"},
                    status=status.HTTP_200_OK)
    

    def post(self, request):
        user_serializer = UserSerializer(data=request.data)
        if user_serializer.is_valid():
            user_serializer.save()
            return JsonResponse(user_serializer.data,
                                status=status.HTTP_201_CREATED)
        return JsonResponse(user_serializer.errors,
                            status=status.HTTP_400_BAD_REQUEST)


def get_user_from_jwt(self, request):
    """Retrieve user object from incoming JWT"""

    header = JWTAuthentication.get_header(self, request=request)
    raw_token = JWTAuthentication.get_raw_token(self, header=header)
    val_token = JWTAuthentication.get_validated_token(self,
                                                      raw_token=raw_token)
    user = JWTAuthentication.get_user(self, validated_token=val_token)

    return user


def convert_has_media_to_boolean(has_media):
    """Convert incoming has_media from string to boolean"""

    true_values = ['true', 'yes', 't', 'y']
    if has_media.lower() in true_values:
        return True
    return False


class PostView(APIView):
    """API for fetching all post and creating new post"""

    permission_classes = (IsAuthenticated, )

    def get(self, request):
        posts = Post.objects.all().order_by('-created_at')
        post_serializer = PostSerializer(posts, many=True)
        return JsonResponse(post_serializer.data,
                            status=status.HTTP_200_OK,
                            safe=False)

    def post(self, request):
        user = get_user_from_jwt(self, request)
        request.data['user_id'] = user.user_id

        has_media = request.data.get('has_media', '')
        request.data['has_media'] = convert_has_media_to_boolean(has_media)

        post_serializer = PostSerializer(data=request.data)
        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"detail": "Post Created"},
                                status=status.HTTP_201_CREATED)
        return JsonResponse({"detail": "Post Not Created"},
                            status=status.HTTP_417_EXPECTATION_FAILED)


class SinglePostView(APIView):
    """API to fetch, update and delete a specific post"""

    permission_classes = (IsAuthenticated, )

    def get(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)
        post_serializer = PostSerializer(post)
        return JsonResponse(post_serializer.data, status=status.HTTP_200_OK)

    def patch(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)

        request_user = get_user_from_jwt(self, request)
        if not post.user_id == request_user:
            return JsonResponse({"detail": "Unauthorized"},
                                status=status.HTTP_401_UNAUTHORIZED)

        has_media = request.data.get('has_media', '')
        request.data['has_media'] = convert_has_media_to_boolean(has_media)

        post_serializer = PostSerializer(post,
                                         data=request.data,
                                         partial=True)

        if post_serializer.is_valid():
            post_serializer.save()
            return JsonResponse({"detail": "Post Updated"},
                                status=status.HTTP_200_OK)
        return JsonResponse({"detail": "Post Not Updated"},
                            status=status.HTTP_417_EXPECTATION_FAILED)

    def delete(self, request, post_id):
        post = get_object_or_404(Post, post_id=post_id)

        request_user = get_user_from_jwt(self, request)
        if not post.user_id == request_user:
            return JsonResponse({"detail": "Unauthorized"},
                                status=status.HTTP_401_UNAUTHORIZED)

        post.delete()
        return JsonResponse({"detail": "Post Deleted"},
                            status=status.HTTP_200_OK)
