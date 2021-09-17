from django.db import models

# Create your models here.

class clearance(models.Model):
    cname       = models.CharField(max_length=120)
    ccode       = models.AutoField(unique=True,primary_key=True)
    mcode       = models.CharField(max_length=10)