import os
import re

from django.contrib.auth import authenticate
from django.contrib.auth import get_user_model
from rest_framework import serializers
from rest_framework import exceptions

from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer

from .models import User, Post, Likes, Bookmarks, ReportPost


UserModel = get_user_model()


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField(required=False)
    email = serializers.CharField(required=False)
    password = serializers.CharField()

    def validate(self, data):

        username = data.get('username', '')
        email = data.get('email', '')
        password = data.get('password', '')

        if email:
            try:
                requested_user = UserModel.objects.get(email=email)
            except UserModel.DoesNotExist:
                raise exceptions.ValidationError()
            else:
                user = authenticate(username=requested_user.username,
                                    password=password)

        if username:
            user = authenticate(username=username, password=password)

        if user:
            return {"user": user}
        raise exceptions.ValidationError()


class UserSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        user = UserModel.objects.create(
            email=validate_data.get('email', ''),
            username=validate_data.get('username', ''),
            name=validate_data.get('name', ''),
            date_of_birth=validate_data.get('date_of_birth', ''),
            bio=validate_data.get('bio', ''),
            security_que=validate_data.get('security_que', '').lower(),
            security_ans=validate_data.get('security_ans', '').lower()
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
            'security_que',
            'security_ans',
        ]

        extra_kwargs = {
            'password': {'write_only': True},
            'security_ans': {'write_only': True}
        }


class PostSerializer(serializers.ModelSerializer):

    def get_tags(self, post):
        tags = {}
        tags['hashtag'] = re.findall("[#]\w+", post)

        analyzer = SentimentIntensityAnalyzer()
        vs = analyzer.polarity_scores(post)
        compound = vs.get('compound', 0)

        if compound >= 0.5:
            sentiment = 'positive'
        elif compound >= -0.5 and compound <= 0.5:
            sentiment = 'neutral'
        else:
            sentiment = 'negative'

        tags['sentiment'] = sentiment
        return tags

    def create(self, validate_data):
        tags = self.get_tags(validate_data.get('content', ''))

        post = Post.objects.create(
            content=validate_data.get('content', ''),
            user_id=validate_data.get('user_id', ''),
            tags=tags
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
            'tags'
        ]


class LikeSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        post_id = validate_data.get('post_id', '')
        user_id = validate_data.get('user_id', '')
        like = Likes.objects.create(
            post_id=post_id,
            user_id=user_id
        )
        return like

    class Meta:
        model = Likes
        fields = [
            'like_id',
            'post_id',
            'user_id',
            'like_time'
        ]


class BookmarkSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        post_id = validate_data.get('post_id', '')
        user_id = validate_data.get('user_id', '')
        bookmark = Bookmarks.objects.create(
            post_id=post_id,
            user_id=user_id
        )
        return bookmark

    class Meta:
        model = Bookmarks
        fields = [
            'bookmark_id',
            'post_id',
            'user_id',
            'bookmark_time'
        ]


class ReportSerializer(serializers.ModelSerializer):

    def create(self, validate_data):
        post_id = validate_data.get('post_id', '')
        user_id = validate_data.get('user_id', '')
        report = ReportPost.objects.create(
            post_id=post_id,
            user_id=user_id
        )
        return report

    class Meta:
        model = ReportPost
        fields = [
            'report_id',
            'post_id',
            'user_id',
            'report_time'
        ]
