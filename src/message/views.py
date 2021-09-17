from django.shortcuts import render,redirect
from fun import checksession,renlogin,traineedetails
from user.models import user
from trainee.forms import imageform
from trainee.models import trainee
from django.http import HttpResponse
import datetime
import json
date_handler = lambda obj: (
    obj.isoformat()
    if isinstance(obj, (datetime.datetime, datetime.date))
    else None
)
# Create your views here.
def message_view(request,*args,**kwargs):
    context={}
    if request.method == "GET" :
        try:
            request.GET['msgs']
        except:
            mutable = request.GET._mutable
            request.GET._mutable = True
            request.GET['msgs']=None
            request.GET._mutable=mutable
        if request.GET['msgs'] =="" or request.GET['msgs']==None:
            mutable = request.GET._mutable
            request.GET._mutable = True
            try:
                x=user.objects.get(username=request.session['user'])
            except:
                request.session['user']=None
                return(redirect('/login/'))
            try:request.GET['tocode']
            except:request.GET['tocode']=None    
            try:request.GET['totype']
            except:request.GET['totype']=None 
            if x.utype=="T":
                request.GET['tcode']=x.ucode
                request.GET['metype']='T'
                request.GET['mecode']=x.ucode
            else:
                request.GET['tcode']=None
                request.GET['metype']=None
                request.GET['mecode']=None
            if x.utype=="M":
                request.GET['mcode']=x.ucode
                request.GET['metype']='M'
                request.GET['mecode']=x.ucode
                from mentor.models import mentor
                try:
                    cor=mentor.objects.get(mcode=x.ucode).co_ord
                except:
                    print("Mentor object not found")
                if str(cor)=="1":
                    request.GET['co_ord']=1
                    request.GET['metype']='C'
                if str(cor)=="0":
                    request.GET['co_ord']=0
                    request.GET['metype']='M'
            else:
                request.GET['mcode']=None
                request.GET['co_ord']=0
            request.GET._mutable = mutable
            c=checksession(request)
            from trainee.models import trainee
            from mentor.models import mentor

            #trainee msgs
            if request.GET['tcode']!=None:
                try:
                    trq=trainee.objects.get(tcode=request.GET['tcode'])
                except:
                    print("traine object not found !")
            try:
                from group.models import group
                agrps=group.objects.filter().order_by('-gcode')
            except:
                print("group object not found !")
            grp=[]
            if request.GET['tcode'] !=None:    
                grp.append("G-"+str(trq.gcode))
            ment=[]
            if request.GET['mcode']!=None:
                for qweq in agrps:
                    grp.append("G-"+str(qweq.gcode))
            if request.GET['tcode']!=None:
                menti="M-"+str(trq.mcode)
                try:
                    mentnamei=str(mentor.objects.get(mcode=str(trq.mcode)).name)+" (Mentor)"
                except:
                    mentnamei=None
                if mentnamei!=None:
                    nal=(menti,mentnamei)
                    ment.append(nal)
            if request.GET['mcode']!=None:
                try:
                    mni=mentor.objects.filter().order_by('-name')
                except:
                    print("mentors object not found")
                for aer in mni:
                    menti="M-"+str(aer.mcode)
                    mentnamei=str(aer.name)+" (Mentor)"
                    nal=(menti,mentnamei)
                    ment.append(nal)
            try:
                from mentor.models import mentor
                ghi=mentor.objects.get(co_ord=1)
            except:
                ghi=None
            if ghi!=None:
                cord ="C-"+str(ghi.mcode)
                if str(request.GET['co_ord'])=='0':    
                    cordname=str(ghi.name)+" (Co-ordinator)"
                else:
                    cordname=None
            else : cord=None
            context['optionto']={}
            if len(grp)>0:
                if request.GET['tcode']!=None:
                    context['optionto'][grp[0]]="Own Group"
                else:
                    for qm in grp:
                        context['optionto'][qm]=str(qm.split('-')[1])+"-(Group)"
            
            if len(ment)>0:
                if request.GET['tcode']!=None:
                    context['optionto'][ment[0][0]]=ment[0][1]
                if request.GET['mcode']!=None:
                    for opc in ment:
                        a=opc[0].split('-')
                        try:
                            if str(mentor.objects.get(mcode=a[1]).co_ord)!='1' and a[1]!=request.GET['mecode']:
                                context['optionto'][opc[0]]=opc[1]
                        except:
                            print("no object of user")
                            exit()
            if cord !=None and cordname != None:
                context['optionto'][cord]=cordname

            #fellow trainee 
            
            def stuofgrp(grpc):
                if grpc !=None:
                    try:
                        return(trainee.objects.filter(gcode=grpc).order_by('-name'))
                    except:
                        print("trainee object not found")
            #for trainees
            if request.GET['tcode']!=None:
                nxi=stuofgrp(trq.gcode)
            #trainee to list for mentors
            if request.GET['mcode']!=None:
                if request.GET['metype']=='C':
                    try:nxi=trainee.objects.filter().order_by('-name')
                    except:print("co_ord but still cant find trainee")
                else:
                    mbo=1
                    for qm in grp:
                        zli=stuofgrp(qm.split('-')[1])
                        if mbo==1:
                           nxi=zli
                        else:
                            nxi.union(zli,all=True)
                        mbo=mbo+1


            
            zx=[]
            tcodeq=""
            tnameq=""
            try:
                nxi
            except:
                nxi=""
            if str(type(nxi))=="<class 'django.db.models.query.QuerySet'>":
                for i in range(0,len(nxi)):
                    try:
                        tcodeq="T-"+str(nxi[i].tcode)
                    except:
                        print("Trainee object not found !")
                    try:
                        tnameq=str(nxi[i].name)+" (Trainee)"
                    except:
                        tnameq=None
                    cx=(tcodeq,tnameq)
                    if tcodeq != "T-"+str(request.GET['tcode']):
                        zx.append(cx)
                for zq in zx:
                    context['optionto'][zq[0]]=zq[1]
                zx=[]
                tcodeq=""
                tnameq=""
            #sento ends here

            context['msgs']={}
            from message.models import message
            def getmsg():
                try:
                    xop=message.objects.filter(tocode=request.GET['tocode'],totype=request.GET['totype']).order_by('-dateandtime').reverse()
                    rep={}
                    for mg in xop:
                        if mg.fromtype=='M' or mg.fromtype=='C':
                            if len(mentor.objects.filter(mcode=mg.fromcode,co_ord='0'))>0:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='0').name)+" (Mentor)"
                            else:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='1').name)+" (Co-ordinator)"
                        if mg.fromtype=='T':
                            sendername=str(trainee.objects.filter(tcode=mg.fromcode)[0].name)+" (Trainee)"

                        if context['msgs'].get(sendername)==None:
                            context['msgs'][sendername]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=0
                            sendername=""
                        else:
                            context['msgs'][str(sendername)+str(int(rep.get(sendername))+1)]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=int(rep.get(sendername))+1
                            sendername=""
                except:
                    print("mentor or trainee or message object not found")

            if request.GET['totype']=='G':
                getmsg()
            if request.GET['totype']=='M' or request.GET['totype']=='T' or request.GET['totype']=='C':
                try:
                    xop=message.objects.filter(tocode=request.GET['tocode'],totype=request.GET['totype'],fromcode=request.GET['mecode'],fromtype=request.GET['metype']).order_by('-dateandtime').reverse()
                    xopo=message.objects.filter(fromcode=request.GET['tocode'],fromtype=request.GET['totype'],tocode=request.GET['mecode'],totype=request.GET['metype']).order_by('-dateandtime').reverse()
                    #from me to him
                    rep={}
                    for mg in xop:
                        if mg.fromtype=='M'  or mg.fromtype=='C':
                            if len(mentor.objects.filter(mcode=mg.fromcode,co_ord='0'))>0:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='0').name)+" (Mentor)"
                            else:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='1').name)+" (Co-ordinator)"
                        
                        if mg.fromtype=='T':
                            sendername=str(trainee.objects.filter(tcode=mg.fromcode)[0].name)+" (Trainee)"
                       
                        if context['msgs'].get(sendername)==None:
                            context['msgs'][sendername]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=0
                            sendername=""
                        else:
                            context['msgs'][str(sendername)+str(int(rep.get(sendername))+1)]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=int(rep.get(sendername))+1
                            sendername=""
                    #from him to me
                    rep={}
                    for mg in xopo:
                        if mg.fromtype=='M' or mg.fromtype=='C':
                            if len(mentor.objects.filter(mcode=mg.fromcode,co_ord='0'))>0:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='0').name)+" (Mentor)"
                            else:
                                sendername=str(mentor.objects.get(mcode=mg.fromcode,co_ord='1').name)+" (Co-ordinator)"
                        if mg.fromtype=='T':
                            sendername=str(trainee.objects.filter(tcode=mg.fromcode)[0].name)+" (Trainee)"
                        if context['msgs'].get(sendername)==None:
                            context['msgs'][sendername]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=0
                            sendername=""
                        else:
                            context['msgs'][str(sendername)+str(int(rep.get(sendername))+1)]=[mg.msg,mg.dateandtime.isoformat(),str(mg.fromcode)+str(mg.fromtype)]
                            rep[sendername]=int(rep.get(sendername))+1
                            sendername=""
                except:
                    print("mentor or trainee or message object not found")
            if c!='here':
                return(renlogin(request,None))
            context['expt']="Here"

            # Message Notification
            try:
                nti=message.objects.filter(tocode=request.GET['mecode'],totype=request.GET['metype'],gstatus=0).order_by('-dateandtime').reverse()
                noti={}
                print(nti)
                cntr=1
                for red in nti:
                    if red.fromtype=='M':
                        name=str(mentor.objects.get(mcode=red.fromcode).name)+"(Mentor)"
                    elif red.fromtype=='T':
                        name=str(trainee.objects.get(tcode=red.fromcode).name)+"(Trainee)"
                    elif red.fromtype=='C':
                        name=str(mentor.objects.get(mcode=red.fromcode).name)+"(Co-Ordinator)"
                    else:
                        name=None
                    name=name+str(cntr)
                    noti[name]={}
                    noti[name]['notimsg']=red.msg
                    noti[name]['notifromcode']=red.fromcode
                    noti[name]['notifromtype']=red.fromtype
                    noti[name]['notitocode']=red.tocode
                    noti[name]['notitotype']=red.totype
                    cntr=cntr+1
                if len(noti)!=0:
                    context['noti']=noti
                else:
                    context['noti']='None'
            except:
                context['noti']='None'
            # Notification End
            allmsg=context['msgs']
            nam={}
            dtl=[]
            for a in allmsg:
                dtl.append(allmsg[a][1])
            dtl.sort()
            for b in dtl:
                for aa in allmsg:
                    if b == allmsg[aa][1]:
                        nam[aa]=allmsg[aa]
            context['msgs']=nam
            context['mecode']=str(request.GET['mecode'])+str(request.GET['metype'])
            return(render(request,"messages.html",context))
    
    if request.GET['msgs'] !="" or request.GET['msgs']!=None :
        mutable = request.GET._mutable
        request.GET._mutable = True
        try:
            x=user.objects.get(username=request.session['user'])
        except:
            x=0
        try:tocode=request.GET['tocode']
        except:tocode=None    
        try:totype=request.GET['totype']
        except:totype=None 
        if x.utype=="T":
            request.GET['tcode']=x.ucode
            request.GET['metype']='T'
            request.GET['mecode']=x.ucode
        else:
            request.GET['tcode']=None
            request.GET['metype']=None
            request.GET['mecode']=None
        if x.utype=="M":
            request.GET['mcode']=x.ucode
            request.GET['metype']='M'
            request.GET['mecode']=x.ucode
            from mentor.models import mentor
            try:
                cor=mentor.objects.get(mcode=x.ucode).co_ord
            except:
                print("Mentor object not found")
            if str(cor)=="1":
                request.GET['co_ord']=1
                request.GET['metype']='C'
        else:
            request.GET['mcode']=None
            request.GET['co_ord']=0
        request.GET._mutable = mutable
        try:
            msgs=request.GET['msgs']
        except:
            msgs=None
        print("\n\n",msgs,"\n\n")
        if msgs!=None and msgs!="":
            from message.models import message
            mecode=request.GET['mecode']
            metype=request.GET['metype']
            print("\ntocode=",tocode,"\ntotype=",totype,"\nfromcode=",mecode,"\nfromtype=",metype,"\nmsg=",msgs)
            try:
                from message.models import message
                message.objects.create(tocode=tocode,totype=totype,fromcode=mecode,fromtype=metype,msg=msgs)
                context['expt']="Done"
            except:
                context['expt']="Message object not saved"
                print("Message object not saved")
            return(HttpResponse(context['expt']))
        else:
            context['expt']=""
            return(HttpResponse(context['expt']))

def chat_view(request,*args,**kwargs):
    return(render(request,'chat.html',{}))

def sendto_view(request,*args,**kwargs):
    context={}
    if request.method == "GET" :
        try:
            request.GET['msgs']
        except:
            mutable = request.GET._mutable
            request.GET._mutable = True
            request.GET['msgs']=None
            request.GET._mutable=mutable
        if request.GET['msgs'] =="" or request.GET['msgs']==None:
            mutable = request.GET._mutable
            request.GET._mutable = True
            try:
                x=user.objects.get(username=request.session['user'])
            except:
                request.session['user']=None
                return(redirect('/login/'))
            try:request.GET['tocode']
            except:request.GET['tocode']=None    
            try:request.GET['totype']
            except:request.GET['totype']=None 
            if x.utype=="T":
                request.GET['tcode']=x.ucode
                request.GET['metype']='T'
                request.GET['mecode']=x.ucode
            else:
                request.GET['tcode']=None
                request.GET['metype']=None
                request.GET['mecode']=None
            if x.utype=="M":
                request.GET['mcode']=x.ucode
                request.GET['metype']='M'
                request.GET['mecode']=x.ucode
                from mentor.models import mentor
                try:
                    cor=mentor.objects.get(mcode=x.ucode).co_ord
                except:
                    print("Mentor object not found")
                if str(cor)=="1":
                    request.GET['co_ord']=1
                    request.GET['metype']='C'
                if str(cor)=="0":
                    request.GET['co_ord']=0
                    request.GET['metype']='M'
            else:
                request.GET['mcode']=None
                request.GET['co_ord']=0
            request.GET._mutable = mutable
            try:
                c=checksession(request)
            except:
                print(c)
                checksession(request)
            from trainee.models import trainee
            from mentor.models import mentor

            #trainee msgs
            if request.GET['tcode']!=None:
                try:
                    trq=trainee.objects.get(tcode=request.GET['tcode'])
                except:
                    print("traine object not found !")
            try:
                from group.models import group
                if str(request.GET['co_ord'])=='1':
                    agrps=group.objects.filter().order_by('-gcode')
                else:
                    agrps=group.objects.filter(mcode=request.GET['mecode']).order_by('-gcode')
            except:
                print("group object not found !")
            grp=[]
            if request.GET['tcode'] !=None:    
                grp.append("G-"+str(trq.gcode))
            ment=[]
            if request.GET['mcode']!=None:
                for qweq in agrps:
                    grp.append("G-"+str(qweq.gcode))
            if request.GET['tcode']!=None:
                menti="M-"+str(trq.mcode)
                try:
                    mentnamei=str(mentor.objects.get(mcode=str(trq.mcode)).name)+" (Mentor)"
                except:
                    mentnamei=None
                if mentnamei!=None:
                    nal=(menti,mentnamei)
                    ment.append(nal)
            if request.GET['mcode']!=None:
                try:
                    mni=mentor.objects.filter().order_by('-name')
                except:
                    print("mentors object not found")
                for aer in mni:
                    menti="M-"+str(aer.mcode)
                    mentnamei=str(aer.name)+" (Mentor)"
                    nal=(menti,mentnamei)
                    ment.append(nal)
            from mentor.models import mentor
            try:
                from mentor.models import mentor
                ghi=mentor.objects.filter(co_ord=1)[0]
            except:
                ghi=None
            if ghi!=None:
                cord ="C-"+str(ghi.mcode)
                if str(request.GET['co_ord'])=='0':    
                    cordname=str(ghi.name)+" (Co-ordinator)"
                else:
                    cordname=None
            else : cord=None
            context['optionto']={}
            if len(grp)>0:
                if request.GET['tcode']!=None:
                    context['optionto'][grp[0]]="Own Group"
                else:
                    for qm in grp:
                        context['optionto'][qm]=str(qm.split('-')[1])+"-(Group)"
            
            if len(ment)>0:
                if request.GET['tcode']!=None:
                    context['optionto'][ment[0][0]]=ment[0][1]
                if request.GET['mcode']!=None:
                    for opc in ment:
                        a=opc[0].split('-')
                        try:
                            if str(mentor.objects.get(mcode=a[1]).co_ord)!='1' and a[1]!=request.GET['mecode']:
                                context['optionto'][opc[0]]=opc[1]
                        except:
                            print("no object of user")
                            exit()
            if cord !=None and cordname != None:
                context['optionto'][cord]=cordname

            #fellow trainee 
            
            def stuofgrp(grpc):
                if grpc !=None:
                    try:
                        return(trainee.objects.filter(gcode=grpc).order_by('-name'))
                    except:
                        print("trainee object not found")
            #for trainees
            if request.GET['tcode']!=None:
                nxi=stuofgrp(trq.gcode)
            #trainee to list for mentors
            if request.GET['mcode']!=None:
                if request.GET['metype']=='C':
                    try:nxi=trainee.objects.filter().order_by('-name')
                    except:print("co_ord but still cant find trainee")
                else:
                    mbo=1
                    for qm in grp:
                        zli=stuofgrp(qm.split('-')[1])
                        if mbo==1:
                           nxi=zli
                        else:
                            nxi = nxi | zli
                        mbo=mbo+1
            zx=[]
            tcodeq=""
            tnameq=""
            try:
                nxi
            except:
                nxi=""
            if str(type(nxi))=="<class 'django.db.models.query.QuerySet'>":
                for i in range(0,len(nxi)):
                    try:
                        tcodeq="T-"+str(nxi[i].tcode)
                    except:
                        print("Trainee object not found !")
                    try:
                        tnameq=str(nxi[i].name)+" (Trainee)"
                    except:
                        tnameq=None
                    cx=(tcodeq,tnameq)
                    if tcodeq != "T-"+str(request.GET['tcode']):
                        zx.append(cx)
                for zq in zx:
                    context['optionto'][zq[0]]=zq[1]
                zx=[]
                tcodeq=""
                tnameq=""
            try:
                context['optiontoselected']=str(request.GET['totype'])+"-"+str(request.GET['tocode'])
            except:
                context['optiontoselected']=None
            return(render(request,"sendto.html",context)) 

def rdmsg(request,*args,**kwargs):
    if request.method=="GET":
        try:
            from message.models import message
            nfromtype=str(request.GET['nfromtype'])
            nfromcode=str(request.GET['nfromcode'])
            nmsg=str(request.GET['nmsg'])
            ntocode=str(request.GET['ntocode'])
            ntotype=str(request.GET['ntotype'])
            message.objects.filter(fromtype=nfromtype,fromcode=nfromcode,msg=nmsg,tocode=ntocode,totype=ntotype).update(gstatus=1).order_by('-dateandtime').reverse()
            p=HttpResponse("Done")
        except:
            p=HttpResponse("None")
        return(p)