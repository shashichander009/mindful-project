import os
import base64

from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model
from django.core.files.base import ContentFile
from rest_framework import serializers
from rest_framework import exceptions

from .models import User, Post


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, data):
        username = data.get('username', '')
        password = data.get('password', '')

        if username and password:
            user = authenticate(username=username, password=password)
            if user:
                return {"user": user}

        raise exceptions.ValidationError()


UserModel = get_user_model()


class UserSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        user = UserModel.objects.create(
            email=validate_data.get('email', ''),
            username=validate_data.get('username', ''),
            name=validate_data.get('name', ''),
            date_of_birth=validate_data.get('date_of_birth', ''),
            bio=validate_data.get('bio', ''),
        )

        incoming_img = validate_data.get('profile_picture', '')
        filename, ext = os.path.splitext(incoming_img.name)
        incoming_img.name = '{}{}'.format(user.user_id, ext)

        user.profile_picture = incoming_img
        user.set_password(validate_data.get('password', ''))
        user.save()
        
        return user

    class Meta:
        model = User
        fields = [
            'username',
            'password',
            'email',
            'name',
            'date_of_birth',
            'bio',
            'profile_picture',
            'last_active',
        ]

        extra_kwargs = {
            'password': {'write_only': True}
        }


class PostSerializer(serializers.ModelSerializer):
    
    def create(self, validate_data):
        post = Post.objects.create(
            content=validate_data.get('content', ''),
            user_id=validate_data.get('user_id', ''),
            tags={"sample_tag_key": "sample_value"}
        )

        if validate_data.get('has_media', False):
            incoming_img = validate_data.get('image', '')

            filename, ext = os.path.splitext(incoming_img.name)
            incoming_img.name = '{}{}'.format(post.post_id, ext)

            post.has_media = True
            post.image = incoming_img
            post.save()

        return post


    def update(self, instance, validated_data):
        instance.content = validated_data.get("content", instance.content)

        if instance.has_media:
            instance.image.delete()
            instance.has_media = False

        if validated_data.get('has_media', False):
            incoming_img = validated_data.get('image', '')

            filename, ext = os.path.splitext(incoming_img.name)
            incoming_img.name = '{}{}'.format(instance.post_id, ext)

            instance.has_media = True
            instance.image = incoming_img

        instance.save()
        return instance


    class Meta:
        model = Post
        fields = [
            'post_id',
            'content',
            'image',
            'has_media',
            'created_at',
            'user_id',
        ]
