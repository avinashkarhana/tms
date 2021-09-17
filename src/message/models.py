from django.db import models
from django.core.validators import MaxValueValidator,MinValueValidator
from datetime import datetime
from django.utils import timezone
import pytz

# Create your models here.
class message(models.Model):
    tocode   = models.CharField(max_length=10) 
    totype   = models.CharField(max_length=1)
    fromcode = models.CharField(max_length=10)
    fromtype = models.CharField(max_length=1)
    gstatus  = models.IntegerField(validators=[ MinValueValidator(0) , MaxValueValidator(1) ], default=0 )
    msg      = models.TextField()
    dateandtime = models.DateTimeField(default=timezone.now, blank=True)