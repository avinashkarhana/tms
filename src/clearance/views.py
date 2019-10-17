from django.shortcuts import render,redirect
from datetime import datetime
from fun import checksession,renlogin,traineedetails
from user.models import user
from django.http import HttpResponse
# Create your views here.

def getclrdata(request,tcd):
    context={}
    try:
        from trainee.models import trainee
        a=trainee.objects.get(tcode=str(tcd))
        zkj=False
    except:
        print("trainee not found !")
        zkj=True
    if zkj:return(redirect("/login/"))
    context['rtype']="T"
    today=datetime.today().strftime('%Y-%m-%d')
    today=today.split("-")[0]+"-"+today.split("-")[1]+"-"+str(int(today.split("-")[2])-1)
    today=datetime.strptime(today,'%Y-%m-%d')
    if str(a.proj_sub_date)=='None':
        a.proj_sub_date='9999-12-31'
    prodate=datetime.strptime(str(a.proj_sub_date),'%Y-%m-%d')
    if  today > prodate :
        try:
            from clearance.models import clearance
            from crequests.models import crequests
            from mentor.models import mentor
            rc=crequests.objects.filter(tcode=a.tcode)
            context['req']={}
            for zi in rc:
                name=str(clearance.objects.get(ccode=zi.ccode).cname)+" (Approval Authority: "+str(mentor.objects.get(mcode=str(clearance.objects.get(ccode=zi.ccode).mcode)).name)+")"
                context['req'][name]=str(zi.status)
            if len(context['req'])<1:
                context['req']="None"
        except:
            context['req']="None"
        return(context)
    else:
        context=None
        return(context)

def clearance_view(request,*args,**kwargs):
    if request.method=="GET":
        from mentor.models import mentor
        mutable = request.GET._mutable
        request.GET._mutable = True
        try:
            x=user.objects.get(username=request.session['user']).ucode
            y=user.objects.get(username=request.session['user']).utype
        except:
            x=0
            y=0
        if y=='T':
            request.GET['tcode']=x
        else:
            request.GET['tcode']=None
        if y=='M' or y=='C':
            request.GET['mcode']=x   
            try:
                co_ord=str(mentor.objects.get(mcode=x).co_ord)
            except:
                co_ord='0'
        else:
            request.GET['mcode']=None
        request.GET['mecode']=x
        request.GET['metype']=y
        request.GET._mutable = mutable
        c=checksession(request)
        if c!='here':
            return(c)
        context={}
        context['alert']='None'
        context['user']=request.session['user']

        if str(request.GET['metype'])=='T':
            aou=getclrdata(request,str(request.GET['mecode']))
            if aou!=None:
                context={**context, **aou}
                from trainee.models import trainee
                try:
                    xo=trainee.objects.get(tcode=str(request.POST['mecode'])).name
                except:
                    xo=None
                    print("no trainee")
                context['ofcname']=str(xo)
                return(render(request,"clearance.html",context))
            else:
                return(HttpResponse("Project Not Submitted Yet !"))

        if str(request.GET['metype'])=='M' or str(request.GET['metype'])=='C':
            context['rtype']='M'
            context['req']='None'
            try:
                from crequests.models import crequests
                from clearance.models import clearance
                from trainee.models import trainee
                inko=clearance.objects.get(mcode=str(request.GET['mecode']))
                context['clname']=inko.cname
                ati=crequests.objects.filter(ccode=str(inko.ccode),status=2) | crequests.objects.filter(ccode=str(clearance.objects.get(mcode=str(request.GET['mecode'])).ccode),status=0)
                if len(ati)>0:
                    context['clrof']={}
                    for ayq in ati:
                        nm=trainee.objects.get(tcode=ayq.tcode).name
                        context['clrof'][nm]=str(ayq.tcode)
                else:
                    context['clrof']="None"
                #extras for co-ordinator:
                context['tdlst']='None'
                if request.GET['metype']=="C" or co_ord=='1':
                    from crequests.models import crequests
                    from trainee.models import trainee
                    cti=crequests.objects.filter()
                    if len(cti)>0:
                        context['tdlst']={}
                        for sl in cti:
                            context['tdlst'][str(sl.tcode)]=str(trainee.objects.get(tcode=str(sl.tcode)).name)
                    else:
                        context['tdlst']='None'
                return(render(request,"clearance.html",context))
            except:
                return(redirect("/login/"))


    if request.method=='POST':
        pd={}
        for key, value in request.POST.items():
            pd[key]= value
        mutable=request.POST._mutable
        request.POST._mutable = True
        try:
            x=user.objects.get(username=request.session['user']).ucode
            y=user.objects.get(username=request.session['user']).utype
        except:
            x=0
            y=0
        if y=='T':
            request.POST['tcode']=x
        else:
            request.POST['tcode']=None
        if y=='M' or y=='C':
            request.POST['mcode']=x   
            try:
                co_ord=str(mentor.objects.get(mcode=x).co_ord)
            except:
                co_ord='0'
        else:
            request.POST['mcode']=None
        try:
            request.POST['makerequest']
        except:
            request.POST['makerequest']=None
        mr=request.POST['makerequest']

        try:
            request.POST['requestresponse']
        except:
            request.POST['requestresponse']=None
        rr=request.POST['requestresponse']

        try:
            request.POST['checkclearance']
        except:
            request.POST['checkclearance']=None
        chc=request.POST['checkclearance']

        request.POST['mecode']=x
        request.POST['metype']=y
        request.POST._mutable = mutable
        c=checksession(request)
        if c!='here':
            return(c)
        context={}
        context['alert']="None"
        context['user']=request.session['user']

        if mr!=None:
            from crequests.models import crequests
            from clearance.models import clearance
            try:
                apo=clearance.objects.filter()
            except:
                apo=None
            if apo!=None and len(apo)>0:
                for ak in apo:
                    try:
                        crequests.objects.create(ccode=ak.ccode,tcode=str(request.POST['mecode']),status=2)
                    except:
                        print("Can't Create request !")
                context['alert']="Request Made !"
                context['rtype']="T"
                aou=getclrdata(request,str(request.POST['mecode']))
                if aou!=None:
                    context={**context, **aou}
                    from trainee.models import trainee
                    try:
                        xo=trainee.objects.get(tcode=str(request.POST['mecode'])).name
                    except:
                        xo=None
                        print("no trainee")
                    context['ofcname']=str(xo)
                    return(render(request,"clearance.html",context))
                else:
                    return(HttpResponse("Project Not Submitted Yet !"))
            else:
                return(HttpResponse("No Clearances to be requested !"))

        if rr!=None:
            from clearance.models import clearance
            from crequests.models import crequests
            del pd['csrfmiddlewaretoken']
            del pd['requestresponse']
            for ax in pd:
                tcde=ax.split("-")[1]
                sts=pd[ax]
                try:
                    ccd=str(clearance.objects.get(mcode=request.POST['mecode']).ccode)
                    crequests.objects.filter(ccode=ccd,tcode=tcde).update(status=sts)
                    context['alert']='Done!'
                except:
                    print("Can't update Clearance !")
                    context['alert']='Not Done!'
            return(redirect("/clearance/"))

        if chc!=None:
            aou=getclrdata(request,str(request.POST['ofc']))
            if aou!=None:
                context={**context, **aou}
                context['ofcname']=str(request.POST['ofcname'])
                return(render(request,"clearance.html",context))
            else:
                return(HttpResponse("Project Not Submitted Yet !"))

    