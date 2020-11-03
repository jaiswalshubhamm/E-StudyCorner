from django.db import models

# Create your models here.
class AdmLogin(models.Model):
    email=models.CharField(max_length=50)
    pwd=models.CharField(max_length=50)
    class Meta:
        db_table='admlogin'

class Notification(models.Model):
    link=models.TextField()
    notification=models.TextField()
    class Meta:
        db_table='notification'

class Email(models.Model):
    to=models.CharField(max_length=50)
    subject=models.CharField(max_length=50)
    txt=models.TextField(default='')
    dt=models.CharField(max_length=30)
    class Meta:
        db_table='email'

class SMS(models.Model):
    mobno=models.CharField(max_length=50)
    msg=models.TextField()
    dt=models.CharField(max_length=30)
    class Meta:
        db_table='sms'

class QPDetails(models.Model):
    paperid=models.CharField(max_length=15, default='')
    subject=models.CharField(max_length=50)
    date=models.CharField(max_length=30)
    time=models.CharField(max_length=30)
    tq=models.CharField(max_length=5)
    udt=models.CharField(max_length=50)
    status=models.TextField(default='false')
    class Meta:
        db_table='qpdetails'

class ExamQuestion(models.Model):
    paperid=models.CharField(max_length=15)
    question=models.TextField()
    a=models.TextField()
    b=models.TextField()
    c=models.TextField()
    d=models.TextField()
    ans=models.TextField()
    class Meta:
        db_table='examquestion'

class Result(models.Model):
    paperid=models.CharField(max_length=15)
    name=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    tq=models.CharField(max_length=15)
    correct=models.CharField(max_length=5)
    ans=models.TextField()
    class Meta:
        db_table='result'

class Upload(models.Model):
    category=models.CharField(max_length=50)
    title=models.CharField(max_length=50)
    description=models.CharField(max_length=50)
    fname=models.TextField()
    dt=models.CharField(max_length=50)
    class Meta:
        db_table='upload'