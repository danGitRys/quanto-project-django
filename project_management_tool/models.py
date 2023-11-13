from typing import Any
from django.db import models

# Pull out data from the Database

# Create your models here.

# TODO implement the Fields of the Database. Maybe rename

class Assignment(models.Model):
    id = models.BigIntegerField(primary_key=True)
    fk_project = models.BigIntegerField()
    fk_employee = models.BigIntegerField()
    role = models.TextField()
    sysStartTime = models.TextField()
    sysEndTime = models.TextField()

    class Meta:
        db_table = 'assignment'
    
    def toJson(self):
        serialized_data = {
            'id': self.id,
            'fk_project': self.fk_project,
            'fk_employee': self.fk_employee,
            'role': self.role,
            'sysStartTime': self.sysStartTime,
            'sysEndTime': self.sysEndTime,
        }
        return serialized_data

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

    def toJson(self):
        serialized_data = {
            'id': self.id,
            'fk_employee': self.fk_employee,
            'fk_position': self.fk_position,
            'start': self.start.isoformat(),  
            'end': self.end.isoformat(),
            'pause': self.pause,
            'time': self.time,
        }
        return serialized_data

class Forecast(models.Model):
    id = models.BigIntegerField(primary_key=True)
    fk_employee = models.BigIntegerField()
    fk_position = models.BigIntegerField()
    start = models.DateTimeField()
    end = models.DateTimeField()
    info = models.TextField()

    class Meta:
        db_table = 'forecast'
    
    def toJson(self):
        serialized_data = {
            'id': self.id,
            'fk_employee': self.fk_employee,
            'fk_position': self.fk_position,
            'start': self.start.isoformat(),  
            'end': self.end.isoformat(),
            'info': self.info,
        }
        return serialized_data

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
    
    def toJson(self):
        serialized_data = {
            'id': self.id,
            'position_id': self.position_id,
            'fk_project': self.fk_project,
            'rate': self.rate,
            'wd': self.wd,
            'volume_total': self.volume_total,
            'volume_remaining': self.volume_remaining,
            'start_date': self.start_date.isoformat(),  
            'end_date': self.end_date.isoformat(),
        }
        return serialized_data

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
    
    def toJson(self):
        serialized_data = {
            'id': self.id,
            'p_id': self.p_id,
            'name': self.name,
            'company': self.company,
            'start_date': self.start_date.isoformat(), 
            'end_date': self.end_date.isoformat(),
            'fk_creator': self.fk_creator,
            'creation_date': self.creation_date.isoformat(),
        }
        return serialized_data
    

class Team(models.Model):
    id = models.BigIntegerField(primary_key=True)
    name = models.TextField(max_length=50)
    info = models.TextField()

    class Meta:
        db_table = 'team'

    def toJson(self):
        serialized_data = {
            'id': self.id,
            'name': self.name,
            'info': self.info,
        }
        return serialized_data 
