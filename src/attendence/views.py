from django.shortcuts import render,redirect
from fun import checksession,renlogin,traineedetails,tattendence
from user.models import user
from mentor.models import mentor
from attendence.models import attendence 
from trainee.models import trainee
from trainee.forms import imageform
from django.http import HttpResponse
from datetime import datetime
# Create your views here.
def attendence_view(request,*args,**kwargs):
    if request.method == "GET" :
        context={}
        try:
            request.GET['saveattendence']
            for key, value in request.GET.items():
                if key!='saveattendence':
                    print(key,value)
                    attendence.objects.create(tcode=key,status=value)
            context['respo']='Done !'
        except:
            context['respo']=None

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
        context['user']=request.session['user']
        try:aof=request.GET['aof']
        except:aof=None
        try:arq=request.GET['arq']
        except:arq=None
        if aof!=None and arq!=None:
            aob=tattendence(aof)
            if aob!="No such Trainee Attendence found" and aob!=[]:
                tato=[]
                for tik in aob:
                    tat={}
                    if str(tik.status)=='1':
                        tat['date']=str(tik.date)
                        tat['status']="Present"
                    if str(tik.status)=='0':
                        tat['date']=str(tik.date)
                        tat["status"]="Absent"
                    tato.append(tat)
                resq=str(tato)
                resq=resq.replace("'",'"')
                response="<input type='hidden' id='atnd' value='"+resq+"' />Select dates to show attendence of :<br>Starting from date: <input type='date' id='sd' placeholder='2019-05-09' />  Till date: <input type='date' id='ed' placeholder='2019-08-04' /><button class='pure-button' onclick='datesel()'>Get Data</button>"
            else:response="No such Trainee Attendence found"
            return(HttpResponse(response))
        else:
            if request.GET['metype']=='T' :
                context['atype']='T'
                context['bname']="Check Attendence"
                context['aof']=request.GET['mecode']
                context['formid']="frm1"
                tlst={}
                from trainee.models import trainee
                try:
                    tlst[request.GET['mecode']]=trainee.objects.get(tcode=request.GET['mecode']).name
                except:
                    print("no trainee found !")
                print(tlst)
                context['tlst']=tlst
                return(render(request,"attendence.html",context))
            
            if request.GET['metype']=='M' and co_ord =='0':
                from group.models import group
                try:
                    grpsofmentor=group.objects.filter(mcode=request.GET['mecode']).order_by('-gcode')
                except:
                    print("no groups found !")
                mbo=1
                nxi="A"
                for a in grpsofmentor:
                    from trainee.models import trainee
                    try:tr=trainee.objects.filter(gcode=a.gcode).order_by('name')
                    except:print("no trainee found")
                    if mbo==1:
                        nxi=tr
                    else:
                       nxi = nxi | tr
                    mbo=mbo+1
                tlst={}
                print(nxi)
                if len(grpsofmentor)>1:
                    for zin in nxi:
                        tlst[zin.tcode]=zin.name
                context['tlst']=tlst
                context['atype']='M'
                return(render(request,"attendence.html",context))

            if request.GET['metype']=='M' and co_ord =='1':
                from trainee.models import trainee
                try:nxi=trainee.objects.filter().order_by('name')
                except:print("no trainee Found")
                tlst={}
                for zin in nxi:
                        tlst[zin.tcode]=zin.name
                atlst={}
                for zin in nxi:
                    if zin.proj_sub_date ==None:
                        zin.proj_sub_date='9000-12-31'
                    zin.proj_sub_date=datetime.strptime(str(zin.proj_sub_date), '%Y-%m-%d')
                    today=datetime.today().strftime('%Y-%m-%d')
                    try:
                        attendence.objects.get(tcode=zin.tcode,date=today)
                        hkl=True
                    except:
                        hkl=False
                    if zin.proj_sub_date >= datetime.strptime(today, '%Y-%m-%d') and hkl==False :
                        atlst[zin.tcode]=zin.name
                context['tlst']=tlst
                context['atlst']=atlst
                context['atype']='C'
                print(context)
                return(render(request,"attendence.html",context))

