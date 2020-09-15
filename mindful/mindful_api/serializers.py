from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model  # for custom user model

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
        user = UserModel.objects.create(
            email=validate_data['email'],
            username=validate_data['username'],
            name=validate_data['name'],
            date_of_birth=validate_data['date_of_birth'],
            bio=validate_data['bio'],
            is_admin=validate_data['is_admin'],
            profile_picture=validate_data["profile_picture"],
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
            'is_admin',
        ]

        extra_kwargs = {
            'password': {'write_only': True},
            'is_admin': {'write_only': True}
        }


class PostSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        post = Post.objects.create(
            content=validate_data['content'],
            user_id=self.context.get("user"),
            tags={"sample_tag_key": "sample_value"}
        )

        return post

    def update(self, instance, validated_data):
        instance.content = validated_data.get('content', instance.content)
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
