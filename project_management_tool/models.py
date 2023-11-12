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


class Booking(models.Model):
    id = models.BigIntegerField(primary_key=True)
    fk_employee = models.BigIntegerField()
    fK_positon = models.BigIntegerField()
    start = models.DateTimeField()
    end = models.DateTimeField()
    pause = models.FloatField()
    time = models.IntegerField()

    class Meta:
        db_table = 'booking'

class Forecast(models.Model):
    id = models.BigIntegerField(primary_key=True)
    fk_employee = models.BigIntegerField()
    fk_position = models.BigIntegerField()
    start = models.DateTimeField()
    end = models.DateTimeField()
    info = models.TextField()

    class Meta:
        db_table = 'forecast'

class Positon(models.Model):
    id = models.BigIntegerField(primary_key=True)
    position_id = models.TextField(max_length=50)
    fk_project = models.BigIntegerField()
    rate = models.FloatField()
    wd = models.FloatField()
    volume_total = models.FloatField()
    volume_remaining = models.FloatField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()

    class Meta:
        db_table = 'position'

class Project(models.Model):
    id = models.BigIntegerField(primary_key=True)
    p_id = models.TextField(max_length=50)
    name = models.TextField(max_length=50)
    company = models.TextField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    fk_creator = models.BigIntegerField()
    creation_date = models.DateTimeField()

    class Meta:
        db_table = 'project'
    

class Team(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.TextField(max_length=50)
    info = models.TextField()

    class Meta:
        db_table = 'team' 
