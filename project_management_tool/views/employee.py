from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from ..models import Employee
from ..jsonValidator import validator
import json
from ..jsonTemplate import *

@csrf_exempt
def getEmployee(request):
     print(request.body)
     if request.method == 'GET':
          employeeList = []
          allEmployees = Employee.objects.all()
          for employee in allEmployees:
               employeeList.append(employee.toJson())
               print(employee.toJson())
          data = {
               "employees": employeeList
          }
          print(employeeList)
          
          return JsonResponse(data)
     elif request.method == 'POST':
          data = invalidMethod
        
     
     else:
           data = {
               "type":"else"
          }

     return JsonResponse(data)
          

