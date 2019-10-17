from django import forms
from user.models import user
class loginform(forms.ModelForm) :
    password=forms.CharField(widget=forms.PasswordInput)
    class Meta:
        model=user
        fields=['username','password']