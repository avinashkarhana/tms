from django import forms 
from trainee.models import trainee
class imageform(forms.ModelForm): 
   class Meta:
       model   = trainee
       fields  = ['img']