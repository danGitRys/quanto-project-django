from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from ..jsonValidator import validator
from ..jsonTemplate import *
import json
@csrf_exempt

def login(request):
    if request.method == "POST":

        if(validator.login(json.loads(request.body))):
            data = {
                "type":"Post"
            }
        else:
             data = {
                "Error":"Invalid Json"
            }

    

    else:
        data = invalidMethod
    
    return JsonResponse(data)

    
