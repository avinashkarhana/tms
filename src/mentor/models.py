from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator
from django.core.exceptions import ValidationError
# Create your models here.
def update_filename(instance, filename):
    import os
    path = "static/mentor/"
    format = instance.mcode + ".jpg"
    xx=os.path.join(path, format)
    print(xx)
    return (xx)

def validate_image(fieldfile_obj):
        filesize = fieldfile_obj.file.size
        megabyte_limit = 1.0
        if filesize > megabyte_limit*1024*1024:
            raise ValidationError(" Max allowed file size is %s MB" % str(megabyte_limit))

class mentor(models.Model):
    name        = models.CharField(max_length=120)
    designation = models.CharField(max_length=120)
    mobile      = models.BigIntegerField(unique=True,validators=[ MinValueValidator(6666666666) , MaxValueValidator(9999999999)],default=9999999999 )
    co_ord      = models.IntegerField(validators=[ MinValueValidator(0) , MaxValueValidator(1)], default=0 )
    dcode       = models.CharField(max_length=10,default=0)
    mcode       = models.AutoField(max_length=10,unique=True,primary_key=True)
    img         = models.ImageField(upload_to=update_filename,blank=True,null=True,validators=[validate_image])