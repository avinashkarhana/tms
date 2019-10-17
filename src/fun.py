from django.shortcuts import render,redirect
from login.forms import loginform
from trainee.models import trainee
from mentor.models import mentor
from attendence.models import attendence

def checksession(request):
    try:
        suser = request.session['user']
    except:
        suser=False
    if suser:
        try:
            from user.models import user
            qw=user.objects.get(username=suser)
        except:
            print("user boject not found !")
            exit()
        if qw != None:
            uty=qw.utype
            if uty=='T':
                print("User : ",suser," loggedin so redirecting !")
                if request.path!='/trainee/' and request.path!='/messages/' and request.path!='/attendence/' and request.path!='/clearance/':
                    return(redirect('/trainee/'))
                else:return("here")
            elif uty=='M':
                from mentor.models import mentor
                try:
                    qq=mentor.objects.get(mcode=qw.ucode).co_ord
                except:
                    print("mentor boject not found !")
                    exit()
                if str(qq)=='1':
                    print("User : ",suser,"  loggedin so redirecting !")
                    if request.path!='/co_ordinator/' and request.path!='/messages/' and request.path!='/attendence/' and request.path!='/clearance/':
                        return(redirect('/co_ordinator/'))
                    else:return("here")
                else:
                    print("User : ",suser,"  loggedin so redirecting !")
                    if request.path!='/mentor/' and request.path!='/messages/' and request.path!='/attendence/' and request.path!='/clearance/':
                        return(redirect('/mentor/'))
                    else:return("here")
            else:
                del request.session['user']
                return(renlogin(request,None))
        else:
            del request.session['user']
            return(renlogin(request,None))
    else:
        return(renlogin(request,None))
    
def renlogin(request,expt):
    form=loginform()
    context={'form':form,'expt':expt}
    if request.path!="/login/":
        return(redirect('/login/'))
    else:
        return (render(request,'login.html',context))

def traineedetails(request):
    try:
        tc=request.POST['tcode']
    except:
        try:tc=request.GET['tcode']
        except:tc=None
    if tc!=None :
        try:
            tr=trainee.objects.get(tcode=tc)
            return(tr)
        except:
            return("Trainee not found !")
    return("No trainee code Sent !")

def mentordetails(request):
    try:
        tc=request.POST['mcode']
    except:
        try:tc=request.GET['mcode']
        except:tc=None
    if tc!=None :
        try:
            from mentor.models import mentor
            tr=mentor.objects.get(mcode=tc)
            return(tr)
        except:
            return("Mentor not found !")
    return("No Mentor code Sent !")

def tattendence(aof):
    try:
        return(attendence.objects.filter(tcode=aof))
    except:
        return("No such Trainee Attendence found")
