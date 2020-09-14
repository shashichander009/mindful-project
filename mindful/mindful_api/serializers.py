from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model  
from django.core.files.base import ContentFile

from rest_framework import serializers
from rest_framework import exceptions

import base64
from .models import User


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
        image_data = validation_data["profile_picture"]
        format, imgstr = image_data.split(';base64,') 
        ext = format.split('/')[-1] 
        profile_picture = ContentFile(base64.b64decode(imgstr), name='user_img.' + ext)
        user = UserModel.objects.create(
            email=validate_data['email'],
            username=validate_data['username'],
            name=validate_data['name'],
            date_of_birth=validate_data['date_of_birth'],
            bio=validate_data['bio'],
            is_admin=validate_data['is_admin'],
            profile_picture=profile_picture,
        )
        user.set_password(validate_data['password'])

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
