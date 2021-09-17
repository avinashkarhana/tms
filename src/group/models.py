from django.db import models

# Create your models here.
class group(models.Model):
    gcode       = models.AutoField(unique=True,primary_key=True)
    dcode       = models.CharField(max_length=10)
    mcode       = models.CharField(max_length=10)