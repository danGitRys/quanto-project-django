from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def view_a(request):
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        print("Post")

    # if a GET (or any other method) we'll create a blank form
    else:
        form = "Not Post"

    return "Test"