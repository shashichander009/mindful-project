from rest_framework import serializers
from .models import User
from rest_framework import exceptions
from django.contrib.auth import authenticate


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
