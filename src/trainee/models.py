from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.exceptions import ValidationError
# Create your models here.
def update_filename(instance, filename):
    import os
    path = "static/trainee/"
    format = str(instance.tcode) + ".jpg"
    xx=os.path.join(path, format)
    print(xx)
    return (xx)

def validate_image(fieldfile_obj):
        filesize = fieldfile_obj.file.size
        megabyte_limit = 1.0
        if filesize > megabyte_limit*1024*1024:
            raise ValidationError(" Max allowed file size is %s MB" % str(megabyte_limit))


class trainee(models.Model):
    rep_date    = models.DateField(default='9999-12-31',auto_now=False)
    tcode       = models.AutoField(unique=True,primary_key=True)
    name        = models.CharField(max_length=120)
    fname       = models.CharField(max_length=120)
    mname       = models.CharField(max_length=120)
    dob         = models.DateField(default='1970-01-01',auto_now=False)
    address     = models.TextField(max_length=320)
    mobile      = models.BigIntegerField(unique=True,validators=[ MinValueValidator(6666666666) , MaxValueValidator(9999999999)] )
    email       = models.EmailField(unique=True)
    institute   = models.CharField(max_length=200)
    qual        = models.CharField(max_length=180)
    dur         = models.IntegerField(default='4',validators=[ MinValueValidator(4) , MaxValueValidator(12)])
    dcode       = models.CharField(max_length=10,blank=True,null=True)
    mcode       = models.CharField(max_length=10,blank=True,null=True)
    gcode       = models.CharField(max_length=10,blank=True,null=True)
    proj        = models.CharField(max_length=200,blank=True,null=True)
    proj_assign_date = models.DateField(default='9999-12-31',blank=True,null=True)
    proj_sub_date = models.DateField(default='9999-12-31',blank=True,null=True)
    clearances  = models.CharField(max_length=200,blank=True,null=True)
    img         = models.ImageField(upload_to=update_filename,blank=True,null=True,validators=[validate_image])