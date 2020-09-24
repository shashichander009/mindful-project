from django.db import models
from django.contrib.postgres.fields import JSONField
from django.contrib.auth.models import AbstractBaseUser
from django.contrib.auth.base_user import BaseUserManager
from django.db.models.signals import post_delete
from django.dispatch import receiver


class CustomUserManager(BaseUserManager):
    def create_user(self, username, email, password, is_admin=False):
        if not username:
            raise ValueError('The Username must be set')
        if not email:
            raise ValueError('The Email must be set')
        if not password:
            raise ValueError('The Password must be set')
        nor_email = self.normalize_email(email)
        user = self.model(username=username, email=nor_email)
        user.set_password(password)
        user.is_admin = is_admin
        if is_admin:
            user.is_superuser = True
        user.save()
        return user

    def create_superuser(self, username, email, password):
        user = self.create_user(
            username=username,
            email=email,
            password=password,
            is_admin=True,
        )
        return user


def upload_location_users(instance, filename):
    filebase, extension = filename.split('.')
    return 'user_images/%s.%s' % (instance.user_id, extension)


def upload_location_posts(instance, filename):
    filebase, extension = filename.split('.')
    return 'post_images/%s.%s' % (instance.post_id, extension)


class User(AbstractBaseUser):
    user_id = models.AutoField(primary_key=True)
    email = models.EmailField(unique=True)
    username = models.CharField(max_length=16, unique=True)
    password = models.CharField(max_length=252)
    name = models.CharField(max_length=128, null=True)
    date_of_birth = models.DateField(null=True)
    bio = models.CharField(max_length=256, null=True)
    profile_picture = models.ImageField(upload_to='user_images/', null=True)
    allow_posting = models.BooleanField(default=True)
    last_active = models.DateTimeField(null=True)
    is_superuser = models.BooleanField(default=False)
    is_admin = models.BooleanField(default=False)
    security_que = models.TextField(max_length=256, null=True)
    security_ans = models.TextField(max_length=256, null=True)

    USERNAME_FIELD = 'username'

    REQUIRED_FIELDS = ['email', 'password']
    objects = CustomUserManager()

    def __str__(self):
        return f'name: {self.name}, email: {self.email}'

    def get_full_name(self):
        return self.first_name

    def get_short_name(self):
        return self.email

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return self.is_admin


class Post(models.Model):
    post_id = models.AutoField(primary_key=True)
    content = models.TextField(max_length=256, null=True)
    image = models.ImageField(upload_to="post_images/", null=True)
    has_media = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    tags = JSONField()
    user_id = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        return f'{self.post_id} is posted by {self.user_id}'


@receiver(post_delete, sender=Post)
def auto_delete_img_on_post_delete(sender, instance, **kwargs):
    instance.image.delete(False)


class Followings(models.Model):
    following_id = models.AutoField(primary_key=True)
    follower_id = models.ForeignKey(User, on_delete=models.CASCADE)
    followed_by_id = models.ForeignKey(User, on_delete=models.CASCADE,
                                       related_name='followers')
    follow_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.followed_by_id} is following {self.follower_id}'


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
