from django.shortcuts import render
from django.http import HttpResponse
import json
from .models import ExternalTable
from .models import Assignment
from .models import Employee
from django.db import connection

# Request-handler

# Create your views here.

def hello_world(request):
    loggedIn = True
    if not loggedIn:
        loggedIn = False
    x = 1
    y = 2
    with connection.cursor() as cursor:
        #cursor.execute("SELECT volume_ream FROM positions ")
        allObjects = Employee.objects.all()
        for emp in allObjects:
            print(emp.forename)
        print(allObjects)
       # rows = cursor.fetchall()
        #print(rows)
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