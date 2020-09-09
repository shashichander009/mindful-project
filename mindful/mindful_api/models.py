from django.db import models
from django.contrib.postgres.fields import JSONField
from django.contrib.auth.hashers import make_password, check_password


class User(models.Model):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=16, unique=True)
    password = models.CharField(max_length=252)
    name = models.CharField(max_length=128, null=True)
    date_of_birth = models.DateField()
    bio = models.CharField(max_length=256, null=True)
    profile_picture = models.ImageField(upload_to='user_images/')
    allow_posting = models.BooleanField(default=True)
    last_active = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'username: {self.username}'

    def get_hashed_password(password):
        return make_password(password)

    def validate_password(password, hashed_password):
        return check_password(password, hashed_password)


class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    content = models.TextField(max_length=256, null=True)
    image = models.ImageField(upload_to='post_images/', null=True)
    has_media = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    tags = JSONField()
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.post_id} is posted by {self.user_id}'


class Followings(models.Model):
    following_id = models.AutoField(primary_key=True)
    follower_id = models.ForeignKey(User, on_delete=models.CASCADE)
    followed_by_id = models.ForeignKey(User, on_delete=models.CASCADE,
                                       related_name='followers')
    follow_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.followed_by_id} is following {self.followed_id}'


class Likes(models.Model):
    like_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    post_id = models.ForeignKey(Post, on_delete=models.CASCADE)
    like_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.post_id} is liked by {self.user_id}'


class Bookmarks(models.Model):
    """This table will store the saved post."""

    bookmark_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    post_id = models.ForeignKey(Post, on_delete=models.CASCADE)
    bookmark_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.post_id} is bookmarked by {self.user_id}'


class ReportPost(models.Model):
    report_id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)
    post_id = models.ForeignKey(Post, on_delete=models.CASCADE)
    remarks = models.TextField(max_length=256)
    report_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.post_id} is reported by {self.user_id}'
