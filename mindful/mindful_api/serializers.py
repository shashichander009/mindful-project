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
            try:
                user = User.objects.get(username=username)
                hashed_password = user.password
                if user.validate_password(password, hashed_password):
                    data['user'] = user
                else:
                    raise exceptions.ValidationError("Incorrect Password")
            except User.DoesNotExist:
                raise exceptions.ValidationError("user does not exist")
        else:
            raise exceptions.ValidationError(
                "Must Provide username and pasword both")
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
