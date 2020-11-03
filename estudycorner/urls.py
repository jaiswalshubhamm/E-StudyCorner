"""estudycorner URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
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
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from estudy import views
from stdZone import views as stdZone
from admZone import views as admZone

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home),
    path('about', views.about),
    path('downloads', views.downloads),
    path('contact', views.contact),
    path('registration', views.registration),
    path('login', views.login),
    path('registerstudent', views.registerStudent),
    path('validatestudentlogin', views.validateStudentLogin),
    path('stddashboard', stdZone.stdDashboard),
    path('stddashboard', stdZone.stdDashboard),
    path('admdashboard', admZone.admDashboard),
    path('admlogin', admZone.admLogin),
    path('admlogout', admZone.admLogout),
    path('logout', views.stdLogout),
    path('validateadminlogin', admZone.validateAdminLogin),
    path('admnotification', admZone.admNotification),
    path('delnotification', admZone.delNotification),
    path('saveenquiry', views.saveEnquiry),
    path('delenquiry', admZone.delEnquiry),
    path('admenquiry', admZone.admEnquiry),
    path('stdfeedback', stdZone.stdFeedback),
    path('admfeedback', admZone.admFeedback),
    path('delfeedback', admZone.delFeedback),
    path('sendemail', admZone.sendEmail),
    path('delemail', admZone.delEmail),
    path('sendsms', admZone.sendSMS),
    path('delsms', admZone.delSMS),
    path('updateprofile', stdZone.updateProfile),
    path('changepassword', stdZone.changePassword),
    path('admprofile', admZone.admProfile),
    path('changeadmpassword', admZone.changeAdmPassword),
    path('stddiscussion', stdZone.stdDiscussion),
    path('questionupload', stdZone.questionUpload),
    path('reply', stdZone.reply),
    path('viewanswer', stdZone.viewAnswer),
    path('admdiscussion', admZone.admDiscussion),
    path('admreply', admZone.admReply),
    path('admviewanswer', admZone.admViewAnswer),
    path('delques', admZone.delQues),
    path('delans', admZone.delAns),
    path('addqp', admZone.addQP),
    path('insertq', admZone.insertQ),
    path('manageqp', admZone.manageQP),
    path('setqp', admZone.setQP),
    path('examrules', stdZone.examRules),
    path('test', stdZone.test),
    path('result', stdZone.result),
    path('manageresult', admZone.manageResult),
    path('manageupload', admZone.manageUpload),
    path('delupload', admZone.delUpload),
    path('studymaterial', stdZone.studyMaterial),
    path('assignments', stdZone.assignments),
    path('delresult', admZone.delResult),
    path('delqp', admZone.delQP),
    path('submitassignment', stdZone.submitAssignment),
    path('submittedtask', admZone.submittedTask),
    path('forgetpassword', views.forgetPassword),
    path('forgetotp', views.forgetOTP),
    path('forgetvarify', views.forgetVarify),
    path('newpass', views.newPass),
]
urlpatterns=urlpatterns+static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)