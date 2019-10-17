from django import forms 
from django.forms import ModelForm,Textarea,TextInput,NumberInput,ChoiceField,CharField
from mentor.models import mentor
from trainee.models import trainee
from group.models import group
from department.models import department

class imageform(forms.ModelForm): 
   class Meta:
       model   = mentor
       fields  = ['img']
class addmentorform(forms.ModelForm):
    ch=()
    try:
        a=department.objects.filter()
    except:
        a=None
    if a!=None:
        for ww in a:
            aew=(ww.dcode,ww.name)
            ch=ch+(aew,)
    dcode=forms.ChoiceField(choices=ch)
    mobile=forms.CharField( widget=TextInput(attrs={'type':'number','max':'9999999999','min':'5555555555'}))
    class Meta:
        model = mentor
        fields = ['name','designation','mobile','dcode']

class addtraineeform(forms.ModelForm):
    ch=()
    try:
        a=department.objects.filter()
    except:
        a=None
    if a!=None:
        for ww in a:
            aew=(ww.dcode,ww.name)
            ch=ch+(aew,)
    dcode=forms.ChoiceField(choices=ch)
    chi=()
    try:
        ai=mentor.objects.filter()
    except:
        ai=None
    if ai!=None:
        for wwi in ai:
            aewi=(wwi.mcode,wwi.name)
            chi=chi+(aewi,)
    mcode=forms.ChoiceField(choices=chi)
    chio=()
    try:
        aio=group.objects.filter()
    except:
        aio=None
    if aio!=None:
        for wwio in aio:
            aewio=(wwio.gcode,str(wwio.gcode)+"-Group")
            chio=chio+(aewio,)
    gcode=forms.ChoiceField(choices=chio)
    mobile=forms.CharField( widget=TextInput(attrs={'type':'number','max':'9999999999','min':'5555555555'}))
    email=forms.CharField( widget=TextInput(attrs={'type':'email'}))
    rep_date=forms.CharField( widget=TextInput(attrs={'value':'9999-12-31','type':'date'}))
    proj_assign_date=forms.CharField(required=False, widget=TextInput(attrs={'value':'9999-12-31','type':'date'}))
    proj_sub_date=forms.CharField(required=False,widget=TextInput(attrs={'value':'9999-12-31','type':'date'}))
    dob=forms.CharField( widget=TextInput(attrs={'type':'date'}))

    class Meta:
        model = trainee
        fields = ['name','fname','mname','dob','address','mobile','email','institute','qual','dur','gcode','dcode','mcode','proj','rep_date','proj_assign_date','proj_sub_date']

class addgroupform(forms.ModelForm):
    ch=()
    try:
        a=department.objects.filter()
    except:
        a=None
    if a!=None:
        for ww in a:
            aew=(ww.dcode,ww.name)
            ch=ch+(aew,)
    dcode=forms.ChoiceField(choices=ch)
    chi=()
    try:
        ai=mentor.objects.filter()
    except:
        ai=None
    if ai!=None:
        for wwi in ai:
            aewi=(wwi.mcode,wwi.name)
            chi=chi+(aewi,)
    mcode=forms.ChoiceField(choices=chi)
    class Meta:
        model = group
        fields = ['dcode','mcode']
