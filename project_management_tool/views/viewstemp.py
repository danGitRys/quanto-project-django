from django.shortcuts import render
from django.http import HttpResponse
import json

from ..models import Assignment
from ..models import Employee
from django.db import connection
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse

# Request-handler

# Create your views here.
@csrf_exempt
def hello_world(request):
    print(request.POST)
    post_data = request.body.decode('utf-8')
    print(post_data)
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
    data = {
        'key1': 'value1',
        'key2': 'value2',
        # Add more key-value pairs as needed
    }
    return JsonResponse(data)

def loginpage(request):
    #bekomme irgendein JSON
    json = json.loads(request)

    #Session-token
    #token = json
    return 

def api(request):
    return HttpResponse("API")


    ...