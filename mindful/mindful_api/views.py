from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.views import APIView

from rest_framework.permissions import IsAuthenticated 

# Create your views here.


class HelloWorld(APIView):
    """
    API Documentation testing Hello World
    """

    permission_classes = (IsAuthenticated, ) 

    def get(self, request, format=None):
        
        respose = "Hello World"

        return JsonResponse(respose, safe=False)


class HelloWorld2(APIView):
    """
    API Documentation testing Hello World 2
    """
    def get(self, request, format=None):

        respose = "Hello World from SECOND CLASS"

        return JsonResponse(respose, safe=False)