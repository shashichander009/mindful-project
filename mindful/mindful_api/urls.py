from django.urls import path
from rest_framework_swagger.views import get_swagger_view
from rest_framework_simplejwt import views as jwt_views

from . import views

schema_view = get_swagger_view(title="Mindful API Documentation")

app_name = 'api'

urlpatterns = [
    path('doc/', schema_view),
    path('login/', views.LoginView.as_view(), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
    path('token/refresh/',
         jwt_views.TokenRefreshView.as_view(),
         name='token_refresh'),
    path('users/', views.UserView.as_view(), name='users'),
    path('post/', views.PostView.as_view(), name='post'),
    path('post/<post_id>/',
         views.SinglePostView.as_view(),
         name='single-post'),
    path('like/<post_id>/',
         views.LikePostView.as_view(),
         name='like-post'),
    path('bookmark/<post_id>/',
         views.BookmarkPostView.as_view(),
         name='bookmark-post'),
    path('report/<post_id>/',
         views.ReportPostView.as_view(),
         name='report-post'),
    path('reset-password/',
         views.update_password,
         name='reset-password'),
    path('follow/<user_id>/',
         views.FollowView.as_view(),
         name='follow'),
    path('followers/<user_id>/',
         views.FollowersView.as_view(),
         name='followers'),
    path('followings/<user_id>/',
         views.FollowingsView.as_view(),
         name='followings'),
    path('profile/',
         views.get_profile,
         name='get-profile'),
    path('search/',
         views.search,
         name='search'),
    path('suggest/',
         views.SuggestionView.as_view(),
         name='suggest'),
    path('timeline/',
         views.timeline,
         name='timeline'),
    path('profiletimeline/<user_id>/',
         views.profile_timeline,
         name='profile-timeline'),
    path('timeline-status/',
         views.timeline_status,
         name='timeline-status')
]
