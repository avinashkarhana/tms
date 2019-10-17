from django.db import models

# Create your models here.

class crequests(models.Model):
    status      = models.CharField(max_length=1,default=0)#0/R/G/D
    ccode       = models.CharField(max_length=10)
    tcode       = models.CharField(max_length=10)
    class Meta:
        unique_together = ('tcode', 'ccode',)