from typing import Any
from django.db import models

# Pull out data from the Database

# Create your models here.

# TODO implement the Fields of the Database. Maybe rename
class ExternalTable(models.Model):
    #field1 = models.CharField(max_length=50)
    projectName = models.CharField(max_length=50)
    