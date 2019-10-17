from django.shortcuts import render,redirect
from fun import checksession,renlogin,traineedetails
from user.models import user
from trainee.forms import imageform
# Create your views here.
def traineepanel_view(request,*args,**kwargs):
    context={}
    if request.method == "GET" :
        mutable = request.GET._mutable
        request.GET._mutable = True
        try:
            x=user.objects.get(username=request.session['user']).ucode
        except:
            x=0
        request.GET['tcode']=x
        request.GET._mutable = mutable
        c=checksession(request)
        if c!='here':
            return(renlogin(request,None))
        instance=traineedetails(request)
        from django.forms.models import model_to_dict
        b=model_to_dict(instance, fields=[field.name for field in instance._meta.fields])
        bb={}
        for ar in b:
            if ar=="tcode":
                bb["Trainee Code"]=b.get('tcode')
            elif ar=="fname":
                bb["Father Name"]=b.get('fname')
            elif ar=="mname":
                bb["Mother Name"]=b.get('mname')
            elif ar=="dur":
                bb["Duration of Internship"]=b.get('dur')
            elif ar=="dcode":
                if b.get('dcode')!=None:
                    from department.models import department
                    try:dept=department.objects.get(dcode=b.get('dcode')).name
                    except:
                        print("department object not found !")
                        exit()
                else: dept="Has not been alloted "
                bb["Department"]=dept
            elif ar=="gcode":
                if b.get('gcode')!=None:
                    bb['Group']=b.get('gcode')
                else:bb['Group']="Has not been alloted "
            elif ar=="mcode":
                if b.get('mcode')!=None:
                    from mentor.models import mentor
                    try:ment=mentor.objects.get(mcode=b.get('mcode')).name
                    except:
                        print("mentor object not found !")
                        exit()
                else: ment="Has not been alloted "
                bb["Mentor"]=ment
            elif ar=="proj":
                if b.get('proj')!=None:
                    bb['Project/Study']=b.get('ar')
                else:bb['Project/Study']="Has not been alloted "
            elif ar=="rep_date":
                if str(b.get('rep_date'))!='None':
                    bb['Reporting Date']=b.get('rep_date')
                else:bb['Reporting Date']="Not Available"
            elif ar=="proj_assign_date":
                if str(b.get('proj_assign_date'))!='None':
                    bb['Project Assignemnt Date']=b.get('proj_assign_date')
                else:bb['Project Assignement Date']="Not Available"
            elif ar=="proj_sub_date":
                if str(b.get('proj_sub_date'))!='None':
                    bb['Project Submission Date']=b.get('proj_sub_date')
                else:bb['Project Submission Date']="Not Available"
            else:
                bb[ar]=b.get(ar)

        context['tcode']=b.get('tcode')
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

        from trainee.forms import imageform
        img1=str(BASE_DIR)+'/static/trainee/'+str(b.get('tcode'))+".jpg"
        img2=str(BASE_DIR)+'/static/trainee/'+str(b.get('tcode'))+".jpeg"
        img3=str(BASE_DIR)+'/static/trainee/'+str(b.get('tcode'))+".png"
        img4=str(BASE_DIR)+'/static/trainee/'+str(b.get('tcode'))+".gif"

        from django.core.files.storage import default_storage
        if default_storage.exists(img1) or default_storage.exists(img2) or default_storage.exists(img3) or default_storage.exists(img4):print("")
        else:    
            form=imageform()
            context['form']=form
        return(render(request,"trainee.html",context))

    if request.method == "POST" :  
        from trainee.forms import imageform 
        from trainee.models import trainee
        try:
            m=user.objects.get(username=request.session['user'])
            z=trainee.objects.get(tcode=m.ucode)
        except:
            print("user boject not found !")
            exit()
        form = imageform(request.POST, request.FILES ,instance=z) 
        if form.is_valid(): 
            m.img = form.cleaned_data['img']
            x=form.save()
            resp="Image Uploaded successfuly !"
            request.session['resp']=resp
            return(redirect("/trainee/"))
        else:
            aa=form.errors
            request.session['resp']=str(aa)
            return(redirect("/trainee/"))
            