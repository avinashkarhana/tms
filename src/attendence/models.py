from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
import datetime

# Create your models here.
class attendence(models.Model):
    tcode     = models.CharField(max_length=10)
    date      = models.DateField(default=datetime.date.today)
    datetime  = models.DateTimeField(auto_now=True)
    status    = models.IntegerField(validators=[ MinValueValidator(0) , MaxValueValidator(1)])
    class Meta:
        unique_together = ('tcode', 'date',)