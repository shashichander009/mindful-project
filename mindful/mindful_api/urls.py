from django.urls import path

from rest_framework_swagger.views import get_swagger_view

from . import views

schema_view = get_swagger_view(title="Mindful API Documentation")

app_name = 'api'

urlpatterns = [
    path('hello/', views.HelloWorld.as_view(), name='hello-world'),
    path('hello2/', views.HelloWorld2.as_view(), name='hello-world2'),
    path('doc/', schema_view),
    path('login/', views.LoginView.as_view(), name='login'),
    path('logout/', views.LogoutView.as_view(), name='logout'),
]
