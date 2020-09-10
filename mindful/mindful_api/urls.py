from django.urls import path

from rest_framework_swagger.views import get_swagger_view
from rest_framework_simplejwt import views as jwt_views 

from . import views

schema_view = get_swagger_view(title="Mindful API Documentation")

app_name = 'api'

urlpatterns = [
    path('hello/', views.HelloWorld.as_view(), name='hello-world'),
    path('hello2/', views.HelloWorld2.as_view(), name='hello-world2'),
    path('doc/', schema_view),

    path('token/', 
         jwt_views.TokenObtainPairView.as_view(), 
         name ='token_obtain_pair'), 
    path('token/refresh/', 
         jwt_views.TokenRefreshView.as_view(), 
         name ='token_refresh'), 
]