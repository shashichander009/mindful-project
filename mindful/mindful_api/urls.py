from django.urls import path
from rest_framework_swagger.views import get_swagger_view
from rest_framework_simplejwt import views as jwt_views

from . import views

schema_view = get_swagger_view(title="Mindful API Documentation")

app_name = 'api'

urlpatterns = [
    path('doc/', schema_view),
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('token/refresh/',
         jwt_views.TokenRefreshView.as_view(),
         name='token_refresh'),
    path('users/', views.UserView.as_view(), name='users'),
    path('post/', views.PostView.as_view(), name='post'),
    path('post/<post_id>/',
         views.SinglePostView.as_view(),
         name='single-post'),
    path('like/<post_id>/',
         views.like_post_view,
         name='like-post'),
    path('bookmark/<post_id>/',
         views.bookmark_post_view,
         name='bookmark-post'),
    path('bookmarks/',
         views.get_bookmarks,
         name='bookmarked-posts'),
    path('report/<post_id>/',
         views.report_post_view,
         name='report-post'),
    path('reset-password/',
         views.update_password,
         name='reset-password'),
    path('follow/<user_id>/',
         views.follow_view,
         name='follow'),
    path('followers/',
         views.followers_view,
         name='followers'),
    path('followings/',
         views.followings_view,
         name='followings'),
    path('search/',
         views.search,
         name='search'),
    path('suggest/',
         views.suggestions_view,
         name='suggest'),
    path('profile/',
         views.get_profile,
         name='profile'),
    path('timeline-status/',
         views.timeline_status,
         name='timeline-status'),
    path('trending/',
         views.get_trending_topics,
         name='get-trending-topics'),
]
