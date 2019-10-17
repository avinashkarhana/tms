from django.db import models
# Create your models here.
class user(models.Model):
    username = models.CharField(max_length=120,unique=True,primary_key=True)
    password = models.CharField(max_length=120)
    utype    = models.CharField(max_length=10)
    ucode    = models.CharField(max_length=10) #tcode,mcode,BLANK(admin)
