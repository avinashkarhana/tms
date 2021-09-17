from django.db import models

# Create your models here.
class department(models.Model):
    name        = models.CharField(max_length=120)
    dcode       = models.AutoField(unique=True,primary_key=True)