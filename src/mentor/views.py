from django.shortcuts import render,redirect
from fun import checksession,renlogin,mentordetails
from user.models import user
from mentor.models import mentor
from trainee.models import trainee
from mentor.forms import imageform,addmentorform,addtraineeform,addgroupform
from group.models import group
# Create your views here.
def mentorpanel_view(request,*args,**kwargs):
    context={}
    if request.method == "GET" :
        mutable = request.GET._mutable
        request.GET._mutable = True
        try:
            x=user.objects.get(username=request.session['user']).ucode
        except:
            x=0
        request.GET['mcode']=x
        request.GET._mutable = mutable
        c=checksession(request)
        if c!='here':
            return(renlogin(request,None))
        instance=mentordetails(request)
        print(type(instance))
        from django.forms.models import model_to_dict
        b=model_to_dict(instance, fields=[field.name for field in instance._meta.fields])
        bb={}
        print(b)
        for ar in b:
            if ar=="dcode":
                if b.get('dcode')!=None:
                    from department.models import department
                    try:dept=department.objects.get(dcode=b.get('dcode')).name
                    except:
                        print("department object not found !")
                        exit()
                else: dept="Has not been alloted "
                bb["Department"]=dept
            elif ar=="mcode":
                bb["Mentor Code"]=b.get('mcode')
            else:
                bb[ar]=b.get(ar)

        context['mcode']=b.get('mcode')
        context['details']=bb
        context['user']=request.session['user']
        if 'resp' in request.session:
            context['expt']=request.session['resp']
            del request.session['resp']
        else:
            context['expt']=None
        #image Check if not provide form
        import os 
        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

        from mentor.forms import imageform
        img1=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".jpg"
        img2=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".jpeg"
        img3=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".png"
        img4=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".gif"

        from django.core.files.storage import default_storage
        if default_storage.exists(img1) or default_storage.exists(img2) or default_storage.exists(img3) or default_storage.exists(img4):print("")
        else:    
            form=imageform()
            context['form']=form
        return(render(request,"mentor.html",context))

    if request.method == "POST" :  
        from mentor.forms import imageform 
        from mentor.models import mentor
        try:
            m=user.objects.get(username=request.session['user'])
            z=mentor.objects.get(mcode=m.ucode)
        except:
            print("user boject not found !")
            exit()
        form = imageform(request.POST, request.FILES ,instance=z) 
        if form.is_valid(): 
            m.img = form.cleaned_data['img']
            x=form.save()
            resp="Image Uploaded successfuly !"
            request.session['resp']=resp
            return(redirect("/mentor/"))
        else:
            aa=form.errors
            request.session['resp']=str(aa)
            return(redirect("/mentor/"))

def co_ord_panel(request,*args,**kwargs):
    context={}
    if request.method == "GET" :
        mutable = request.GET._mutable
        request.GET._mutable = True
        try:
            x=user.objects.get(username=request.session['user']).ucode
        except:
            x=0
        request.GET['mcode']=x
        request.GET._mutable = mutable
        c=checksession(request)
        if c!='here':
            return(renlogin(request,None))
        instance=mentordetails(request)
        print(type(instance))
        from django.forms.models import model_to_dict
        b=model_to_dict(instance, fields=[field.name for field in instance._meta.fields])
        bb={}
        print(b)
        for ar in b:
            if ar=="dcode":
                if b.get('dcode')!=None:
                    from department.models import department
                    try:dept=department.objects.get(dcode=b.get('dcode')).name
                    except:
                        print("department object not found !")
                        exit()
                else: dept="Has not been alloted "
                bb["Department"]=dept
            elif ar=="mcode":
                bb["Mentor Code"]=b.get('mcode')
            else:
                bb[ar]=b.get(ar)

        context['mcode']=b.get('mcode')
        context['details']=bb
        context['user']=request.session['user']
        if 'resp' in request.session:
            context['expt']=request.session['resp']
            del request.session['resp']
        else:
            context['expt']=None
        #image Check if not provide form
        import os 
        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

        from mentor.forms import imageform
        img1=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".jpg"
        img2=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".jpeg"
        img3=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".png"
        img4=str(BASE_DIR)+'/static/mentor/'+str(b.get('mcode'))+".gif"

        from django.core.files.storage import default_storage
        if default_storage.exists(img1) or default_storage.exists(img2) or default_storage.exists(img3) or default_storage.exists(img4):print("")
        else:    
            form=imageform()
            context['form']=form
        return(render(request,"co_ordinator.html",context))

    if request.method == "POST" :  
        from mentor.forms import imageform 
        from mentor.models import mentor
        try:
            m=user.objects.get(username=request.session['user'])
            z=mentor.objects.get(mcode=m.ucode)
        except:
            print("user boject not found !")
            exit()
        form = imageform(request.POST, request.FILES ,instance=z) 
        if form.is_valid(): 
            m.img = form.cleaned_data['img']
            x=form.save()
            resp="Image Uploaded successfuly !"
            request.session['resp']=resp
            return(redirect("/co_ordinator/"))
        else:
            aa=form.errors
            request.session['resp']=str(aa)
            return(redirect("/co_ordinator/"))

def register_view(request,*args,**kwargs):
    try: 
        suser=request.session['user']
    except:
        suser=None
    if suser!=None:
        try:
            x=user.objects.get(username=suser).ucode
            y=user.objects.get(username=suser).utype
        except:
            x=None
            y=None
        if y=='M' or y=='C':
            try:
                z=mentor.objects.get(mcode=x).co_ord
            except:
                z=None
            if str(z)!='1':
                return(redirect('/login/'))
            else:
                context={}
                if request.method == "GET" :
                    formM=addmentorform()
                    formT=addtraineeform()
                    formG=addgroupform()
                    context['formT']=formT
                    context['formM']=formM
                    context['formG']=formG
                    return(render(request,"add.html",context))
                
                if request.method == "POST" :
                    context['respo']=""
                    formM=addmentorform()
                    formT=addtraineeform()
                    formG=addgroupform()
                    
                    try:
                        request.POST['Save Trainee']
                        mt=request.POST._mutable
                        request.POST._mutable=True
                        request.POST['rep_date']=str(request.POST['rep_date']).strip()
                        request.POST['proj_assign_date']=str(request.POST['proj_assign_date']).strip()
                        request.POST['proj_sub_date']=str(request.POST['proj_sub_date']).strip()
                        request.POST._mutable=mt
                        frm=addtraineeform(request.POST)
                        print(request.POST['rep_date'],"**",request.POST['proj_assign_date'],"**",request.POST['proj_sub_date'],"**")
                        if frm.is_valid():
                            nf=frm.save()
                            cd=trainee.objects.get(name=request.POST['name'],fname=request.POST['fname'],mobile=request.POST['mobile'],email=request.POST['email'])
                            try:user.objects.create(username=str(request.POST['name']).replace(" ","").lower()+str(cd.tcode),password=str(request.POST['fname']).split(' ')[0]+'@'+str(cd.dob).split('-')[0],ucode=str(cd.tcode),utype='T')
                            except:context['respo']="Cant Create User! Contact Administrator to create manualy !  "
                            print(nf)
                            if nf!=None:
                                context['formT']=formT
                                context['formM']=formM
                                context['formG']=formG
                                context['respo']='Done !'
                            else:
                                context['respo']=context['respo']+"Can't save !"
                        else:
                            context['formT']=frm
                            context['formM']=formM
                            context['formG']=formG
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    try:
                        request.POST['Save Mentor']
                        frm=addmentorform(request.POST)
                        if frm.is_valid():
                            nf=frm.save()
                            cd=mentor.objects.get(name=request.POST['name'],mobile=request.POST['mobile'])
                            try:user.objects.create(username=str(request.POST['name']).replace(" ","").lower()+str(cd.mcode),password=str(request.POST['name']).split(' ')[0]+'@'+str(cd.mobile).split('-')[0],ucode=str(cd.mcode),utype='M')
                            except:context['respo']="Cant Create User! Contact Administrator to create manualy !  "
                            if nf!=None:
                                context['formM']=formM
                                context['formT']=formT
                                context['formG']=formG
                                context['respo']='Done !'
                            else:
                                context['respo']="Can't save !"
                        else:
                            context['formM']=frm
                            context['formT']=formT
                            context['formG']=formG
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    try:
                        request.POST['Save Group']
                        frm=addgroupform(request.POST)
                        if frm.is_valid():
                            nf=frm.save()
                            print(nf)
                            if nf!=None:
                                context['formG']=formG
                                context['formT']=formT
                                context['formM']=formM
                                context['respo']='Done !'
                            else:
                                context['respo']="Can't save !"
                        else:
                            context['formG']=frm
                            context['formT']=formT
                            context['formM']=formM
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    return(render(request,"add.html",context))

            
    else:
        return(redirect('/login/'))

def edit_view(request,*args,**kwargs):
    try: 
        suser=request.session['user']
    except:
        suser=None
    if suser!=None:
        try:
            x=user.objects.get(username=suser).ucode
            y=user.objects.get(username=suser).utype
        except:
            x=None
            y=None
        if y=='M' or y=='C':
            try:
                z=mentor.objects.get(mcode=x).co_ord
            except:
                z=None
            if str(z)!='1':
                return(redirect('/login/'))
            else:
                context={}
                if request.method == "GET" :
                    try:
                        et=request.GET['et']
                    except:
                        et=None
                    try:
                        ec=request.GET['ec']
                    except:
                        ec=None
                    if et!=None and ec!=None and ec!="" and et!="":
                        if str(et)=='T':
                            try:
                                formT=addtraineeform(instance=trainee.objects.get(tcode=ec))
                                formM=None
                                formG=None
                            except:
                                formT=None
                        if str(et)=='M':
                            try:
                                formM=addmentorform(instance=mentor.objects.get(mcode=ec))
                                formT=None
                                formG=None
                            except:
                                formM=None
                        if str(et)=='G':
                            try:
                                formG=addgroupform(instance=group.objects.get(gcode=ec))
                                formM=None
                                formT=None
                            except:
                                formG=None
                        context['et']=et
                        context['ec']=ec
                        context['formT']=formT
                        context['formM']=formM
                        context['formG']=formG
                        return(render(request,"edit.html",context))

                    else:
                        try:
                            z=trainee.objects.filter()
                            trl={}
                            for ewm in z:
                                trl[ewm.tcode]=ewm.name
                            context['trl']=trl
                        except:
                            trl=None
                            context['trl']=trl
                        try:
                            z=mentor.objects.filter()
                            mnl={}
                            for ewm in z:
                                mnl[ewm.mcode]=ewm.name
                            context['mnl']=mnl
                        except:
                            mnl=None
                            context['mnl']=mnl
                        try:
                            z=group.objects.filter()
                            gpl=[]
                            for ewm in z:
                                gpl.append(ewm.gcode)
                            context['gpl']=gpl
                        except:
                            gpl=None
                            context['gpl']=gpl
                        context['formT']=None
                        context['formM']=None
                        context['formG']=None
                        return(render(request,"edit.html",context))
                    
                elif request.method == "POST" :
                    context['respo']=""
                    try:
                        request.POST['Save Trainee']
                        coq=trainee.objects.get(tcode=request.POST['ec'])
                        frm=addtraineeform(request.POST,instance=coq)
                        if frm.is_valid():
                            nf=frm.save()
                            print(nf)
                            if nf!=None:
                                context['formT']=frm
                                context['respo']='Done !'
                            else:
                                context['respo']="Can't save !"
                        else:
                            context['formT']=frm
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    try:
                        request.POST['Save Mentor']
                        coq=mentor.objects.get(mcode=request.POST['ec'])
                        frm=addmentorform(request.POST,instance=coq)
                        if frm.is_valid():
                            nf=frm.save()
                            print(nf)
                            if nf!=None:
                                context['formT']=frm
                                context['respo']='Done !'
                            else:
                                context['respo']="Can't save !"
                        else:
                            context['formM']=frm
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    try:
                        request.POST['Save Group']
                        coq=group.objects.get(gcode=request.POST['ec'])
                        frm=addgroupform(request.POST,instance=coq)
                        if frm.is_valid():
                            nf=frm.save()
                            print(nf)
                            if nf!=None:
                                context['formT']=frm
                                context['respo']='Done !'
                            else:
                                context['respo']="Can't save !"
                        else:
                            context['formG']=frm
                            context['respo']="Can't save !"
                    except:
                        context['respo']=context['respo']
                    return(render(request,"edit.html",context))
                
                else:
                    return(redirect("/edit/"))

    else:
        return(redirect('/login/'))


