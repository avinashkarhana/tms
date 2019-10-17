from django import template
register = template.Library()

@register.filter(name = 'dickeyval')
def dickeyval(dic,count):
    aa=""
    for a in dic:
        if a=='notimsg':hid="block"
        else:hid="none"
        aa=aa+"<z id='"+str(a)+str(count)+"' onclick='mrkrd("+str(count)+")' style='display:"+hid+";'>"+str(dic.get(a))+"</z>"
    return(aa)