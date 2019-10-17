from django.http import HttpResponse
from django.shortcuts import render,redirect
from login.forms import loginform
from fun import checksession,renlogin
# Create your views here.
def loginpage_view(request,*args,**kwargs):
    if request.method == "GET" :
        zo=checksession(request)
        if zo !=None:
            return(zo)
        else:
            return(renlogin(request,None))
    try:aaw=request.POST['logout']
    except:aaw="Login"
    if request.method == "POST" and aaw!="true" and aaw!="Logout" :
        un=request.POST['username']
        pss=request.POST['password']
        try:
            from user.models import user
            au=user.objects.get(username=un)
        except:
            print("user boject not found !")
            exit()
        if au!= None and str(au.password)==str(pss):
            request.session['user']=str(un)
            return(checksession(request))
        else:
            return(renlogin(request,"Username or Password is Incorrect !"))
    else:
        try: 
            request.session['user']
        except:
            request.session['user']=None
        del request.session['user']
        return(renlogin(request,"Loged Out Successfuly !"))