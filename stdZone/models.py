from django.db import models

# Create your models here.
class Feedback(models.Model):
    name=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    mobno=models.CharField(max_length=50)
    topic=models.CharField(max_length=50)
    feedback=models.TextField()
    class Meta:
        db_table = 'feedback'

class Question(models.Model):
    email=models.CharField(max_length=50)
    question=models.TextField()
    imgname=models.TextField()
    dt=models.CharField(max_length=50)
    class Meta:
        db_table = 'question'

class Answer(models.Model):
    qid=models.CharField(max_length=5)
    email=models.CharField(max_length=50)
    answer=models.TextField()
    imgname=models.TextField()
    dt=models.CharField(max_length=50)
    class Meta:
        db_table = 'answer'

class Assignment(models.Model):
    name=models.CharField(max_length=50)
    email=models.CharField(max_length=50)
    title=models.TextField()
    doc=models.TextField()
    description=models.TextField()
    dt=models.CharField(max_length=50)
    class Meta:
        db_table = 'assignment'