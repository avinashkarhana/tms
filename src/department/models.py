from django.db import models

# Create your models here.
class department(models.Model):
    name        = models.CharField(max_length=120)
    dcode       = models.AutoField(max_length=10,unique=True,primary_key=True)