"""training_management_system URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path

from login.views import loginpage_view
from trainee.views import traineepanel_view
from mentor.views import mentorpanel_view,co_ord_panel
from message.views import message_view,chat_view,sendto_view,rdmsg
from attendence.views import attendence_view
from mentor.views import register_view,edit_view
from clearance.views import clearance_view

urlpatterns = [
    path('', loginpage_view, name='Login'),
    path('trainee/', traineepanel_view, name='Trainee Panel'),
    path('mentor/', mentorpanel_view, name='Mentor Panel'),
    path('login/', loginpage_view, name='Login'),
    path('chat/', chat_view, name='Login'),
    path('messages/', message_view, name='Message'),
    path('admin/', admin.site.urls),
    path('co_ordinator/', co_ord_panel, name='Co_Ordinator Panel'),
    path('sndto/', sendto_view, name='sendto'),
    path('attendence/', attendence_view, name='Attendence'),
    path('register/', register_view, name='Register Panel'),
    path('edit/', edit_view, name='Edit Panel'),
    path('rdmsg/', rdmsg, name='Edit Panel'),
    path('clearance/',clearance_view, name='Clearance Panel')
]
