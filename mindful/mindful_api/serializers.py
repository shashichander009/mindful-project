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
                if user.is_active:
                    data['user'] = user
                else:
                    msg = "User Inactive"
                    raise exceptions.ValidationError(msg)
            else:
                msg = "Incorrect credentials"
                raise exceptions.ValidationError(msg)
        else:
            msg = "Must Provide username and pasword both"
            raise exceptions.ValidationError(msg)
        return data


UserModel = get_user_model()


class UserSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        # image_data = validate_data["profile_picture"]
        # format, imgstr = image_data.split(';base64,') 
        # ext = format.split('/')[-1] 
        # profile_picture = ContentFile(base64.b64decode(imgstr), name='user_img.' + ext)
        user = UserModel.objects.create(
            email=validate_data['email'],
            username=validate_data['username'],
            name=validate_data['name'],
            date_of_birth=validate_data['date_of_birth'],
            bio=validate_data['bio'],
            # is_admin=validate_data['is_admin'],
            # profile_picture=profile_picture,
        )
        user.set_password(validate_data['password'])
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
            'is_admin',]

        extra_kwargs = {
            'password': {'write_only': True},
            'is_admin': {'write_only': True}
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
