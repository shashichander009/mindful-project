from django.contrib import admin
# from django.contrib.auth.admin import UserAdmin

from .models import User, Post, Likes, Bookmarks, ReportPost


admin.site.register(User)
admin.site.register(Post)
admin.site.register(Likes)
admin.site.register(Bookmarks)
admin.site.register(ReportPost)
