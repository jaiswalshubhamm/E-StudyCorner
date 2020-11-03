from django.shortcuts import render
from estudy.cryptography import Encryption
from .models import Register, Login, Enquiry
from admZone.models import SMS
import random
import json
import requests
from django.contrib import auth
from admZone.models import Notification
import urllib
import datetime

# Create your views here.
def home(request):
    data=Notification.objects.all()
    return render(request, 'home.html', {'notification': data})
    
def about(request):
    return render(request, 'about.html')

def downloads(request):
    return render(request, 'download.html')

def contact(request):
    return render(request, 'contact.html')

def registration(request):
    return render(request, 'registration.html')

def registerStudent(request):
    if request.method=='POST':
        sitekey=request.POST['g-recaptcha-response']
        secretkey='6LcGpK0ZAAAAAIcRyKsgxiMMvGElQ0cuNrI_CjTb'
        captchadata={
            'secret': secretkey,
            'response': sitekey
        }
        r=requests.post('https://www.google.com/recaptcha/api/siteverify', data=captchadata)
        response=json.loads(r.text)
        status=response['success']
        if status:
            uname=request.POST['name']
            gender=request.POST['gender']
            dob=request.POST['dob']
            mobno=request.POST['mobno']
            pwd=request.POST['pwd']
            email=request.POST['email']
            course=request.POST['course']
            pwd=request.POST['pwd']
            address=request.POST['address']
            file=request.FILES['img']
            r=random.randrange(9999999)
            fname='Media/userpictures/'+str(r)+file.name
            with open(fname, 'wb+') as myfile:
                for i in file.chunks():
                    myfile.write(i)
            reg=Register(name=uname, gender=gender, dob=dob, email=email, mobno=mobno, course=course, picture=fname, address=address)
            reg.save()
            c=Encryption()
            l=Login(email=email, pwd=c.encryptMyData(pwd))
            l.save()
            return render(request, 'login.html', {'msg': 'Regstration Success, Please login'})
        else:
            return render(request, 'registration.html', {'msg': 'Invalid Captcha, Please try again'})
    else:
        return render(request, 'registration.html')

def login(request):
    return render(request, 'login.html')

def stdLogout(request):
    auth.logout(request)
    return render(request, 'login.html')

def validateStudentLogin(request):
    if request.method=='POST':
        id=request.POST['email']
        pwd=request.POST['pwd']
        c=Encryption()
        l=Login.objects.all().filter(email=id, pwd=c.encryptMyData(pwd))
        count=0
        for i in l:
            count=count+1
        if count==1:
            request.session['id']=id
            return render(request, 'stdDashboard.html')
        else:
            return render(request, 'login.html', {'msg': 'Invalid ID/Password'})
    else:
        return render(request, 'login.html', {'msg': 'Please Input UserId And Password'})

def saveEnquiry(request):
    if request.method=='POST':
        name=request.POST['name']
        email=request.POST['email']
        mobno=request.POST['phonenumber']
        topic=request.POST['topic']
        msg=request.POST['msg']
        e=Enquiry(name=name, email=email, mobno=mobno, topic=topic, msg=msg)
        e.save()
        return render(request, 'home.html', {'msg': 'Record submitted successfully.'})
    else:
        return render(request, 'home.html', {'msg': 'Please Input Your Query'})

def forgetPassword(request):
    return render(request, 'forgetPassword.html')

def forgetOTP(request):
    email=request.POST['email']
    mobno=request.POST['mobno']
    r=Register.objects.all().filter(email=email, mobno=mobno)
    count=0
    for i in r:
        count=count+1
    if count==1:
        try:
            num=random.randrange(10000)
            msg='Your One Time Password (OTP) for E-Study Corner is {}.'
            otp=msg.format(num)
            nmsg=urllib.request.quote(otp)

            # SMS Code
            api="http://t.160smsalert.com/submitsms.jsp?user=kkmishra&key=5a78c161adXX&mobile={}&message={}&senderid=TXTSMS&accusage=1"
            napi=api.format(mobno, nmsg)
            res=urllib.request.urlopen(napi)
            request.session['otp']=num
            return render(request, 'forgetOTP.html', {'email': email})
        except:
            return render(request, 'forgetOTP.html', {'msg': 'Unable To send OTP, Please Try Again.'})
    else:
        return render(request, 'forgetPassword.html', {'msg': 'Invalid Mobile Number/Email'})

def forgetVarify(request):
    uotp=request.POST['uotp']
    email=request.POST['email']
    sotp=request.session['otp']
    if str(uotp)==str(sotp):
        return render(request, 'newPass.html', {'email': email})
    else:
        return render(request, 'forgetOTP.html', {'msg': 'Invalid OTP, Please try again.'})

def newPass(request):
    try:
        email=request.POST['email']
        pwd=request.POST['newpwd']
        c=Encryption()
        l=Login.objects.filter(email=email)
        l.update(pwd=c.encryptMyData(pwd))
        return render(request, 'login.html', {'msg': 'Password Changed Succesfully.'})
    except:
        return render(request, 'newpass.html', {'msg': 'Unable to update password plase try again.','email':email})