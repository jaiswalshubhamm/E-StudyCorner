from django.db import models

# Create your models here.
class Register(models.Model):
    name=models.CharField(max_length=50)
    gender=models.CharField(max_length=8)
    dob=models.CharField(max_length=25)
    email=models.CharField(max_length=50)
    mobno=models.CharField(max_length=50)
    course=models.CharField(max_length=50)
    picture=models.TextField()
    address=models.TextField()
    class Meta:
        db_table = 'registration'

class Login(models.Model):
    email=models.CharField(max_length=50)
    pwd=models.CharField(max_length=50)
    class Meta:
        db_table = 'login'

class Enquiry(models.Model):
    name=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    mobno=models.CharField(max_length=50)
    topic=models.CharField(max_length=50)
    msg=models.TextField()
    class Meta:
        db_table = 'enquiry'