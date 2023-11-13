from typing import Any
from django.db import models

# Pull out data from the Database

# Create your models here.

# TODO implement the Fields of the Database. Maybe rename
class ExternalTable(models.Model):
    #field1 = models.CharField(max_length=50)
    projectName = models.CharField(max_length=50)

class Assignment(models.Model):
    id = models.BigIntegerField(primary_key=True)
    fk_project = models.BigIntegerField()
    fk_employee = models.BigIntegerField()
    role = models.TextField()
    sysStartTime = models.TextField()
    sysEndTime = models.TextField()

    class Meta:
        db_table = 'assignment'

class Employee(models.Model):
    id = models.BigIntegerField(primary_key=True)
    emp_id = models.BigIntegerField()
    forename = models.TextField(max_length=50)
    surname = models.TextField(max_length=50)
    mail = models.TextField(max_length=50)
    phone = models.TextField(max_length=50)
    fk_team_id = models.BigIntegerField()
    team_roll = models.TextField(max_length=50)

    class Meta:
        db_table = 'employee'
    
    def toJson(self):
        serialized_data = {
            'id': self.id,
            'emp_id': self.emp_id,
            'forename': self.forename,
            'surname': self.surname,
            'mail': self.mail,
            'phone': self.phone,
            'fk_team_id': self.fk_team_id,
            'team_roll': self.team_roll,
        }
        return serialized_data


    