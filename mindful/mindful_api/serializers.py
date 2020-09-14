from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model  # for custom user model

from rest_framework import serializers
from rest_framework import exceptions

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
        print(validate_data)
        user = UserModel.objects.create(
            email=validate_data['email'],
            username=validate_data['username'],
            name=validate_data['name'],
            date_of_birth=validate_data['date_of_birth'],
            bio=validate_data['bio'],
        )
        user.set_password(validate_data['password'])
        print(validate_data)
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
            'last_active']

        extra_kwargs = {
            'password': {'write_only': True}
        }
