from django.shortcuts import render
from django.http import HttpResponse
import json
from .models import ExternalTable

# Request-handler

# Create your views here.

def hello_world(request):
    loggedIn = True
    if not loggedIn:
        loggedIn = False
    x = 1
    y = 2
    return render(request, 'HelloWorld.html', { 'name' : 'Fabi' })

def loginpage(request):
    #bekomme irgendein JSON
    json = json.loads(request)

    #Session-token
    #token = json
    return 

def api(request):
    return HttpResponse("API")

# TODO implement views
def my_view(request):
    objects = ExternalTable.objects.all()
    ...