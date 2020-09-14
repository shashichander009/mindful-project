from django.urls import path

from rest_framework_swagger.views import get_swagger_view
from rest_framework_simplejwt import views as jwt_views

from . import views

schema_view = get_swagger_view(title="Mindful API Documentation")

app_name = 'api'

urlpatterns = [
    path('hello/', views.HelloWorld.as_view(), name='hello-world'),
    path('doc/', schema_view),
    path('login/', views.LoginView.as_view(), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
#     path('token/',
#          jwt_views.TokenObtainPairView.as_view(),
#          name='token_obtain_pair'),
    path('token/refresh/',
         jwt_views.TokenRefreshView.as_view(),
         name='token_refresh'),
    path('signup/', views.SignupView.as_view(), name='signup'),
    path('users/', views.UserView.as_view(), name='users'),
    path('post/', views.PostView.as_view(), name='post'),
    path('post/<post_id>/', views.SinglePostView.as_view(), name='single-post'),
]
