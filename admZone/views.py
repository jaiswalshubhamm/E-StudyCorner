from django.shortcuts import render
from estudy.cryptography import Encryption
from .models import AdmLogin, Notification, Email, SMS, QPDetails, ExamQuestion, Result, Upload
from estudy.models import Enquiry
from stdZone.models import Feedback, Question, Answer, Assignment
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import datetime
from django.contrib import auth
import smtplib
import urllib
import random

# Create your views here.
def admLogin(request):
    return render(request, 'admLogin.html')

def admLogout(request):
    auth.logout(request)
    return render(request, 'admLogin.html')

def validateAdminLogin(request):
    if request.method=='POST':
        email=request.POST['username']
        pwd=request.POST['password']
        c=Encryption()
        l=AdmLogin.objects.all().filter(email=email, pwd=c.encryptMyData(pwd))
        count=0
        for i in l:
            count=count+1
        if count==1:
            request.session['aid']=email
            return render(request, 'admDashboard.html')
        else:
            return render(request, 'admLogin.html', {'msg': 'Invalid ID/Password'})
    else:
        return render(request, 'login.html', {'msg': 'Please Input UserId And Password'})

def admDashboard(request):
    try:
        if request.session['aid'] is not None:
            return render(request, 'admDashboard.html')
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def admNotification(request):
    try:
        if request.session['aid'] is not None:
            records=Notification.objects.all()
            if request.method=='POST':
                link=request.POST['link']
                notification=request.POST['notification']
                n=Notification(link=link, notification=notification)
                n.save()
                return render(request, 'admNotification.html', {'msg': 'Notification Added Successsfully.', 'data':records})
            else:
                return render(request, 'admNotification.html',{'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delNotification(request):
    try:
        if request.session['aid'] is not None:
            records=Notification.objects.all()
            id=request.GET['id']
            n=Notification.objects.get(id=id)
            n.delete()
            return render(request, 'admNotification.html', {'msg': 'Notification Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def admEnquiry(request):
    try:
        if request.session['aid'] is not None:
            e=Enquiry.objects.all()
            return render(request, 'admEnquiry.html', {'data':e})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delEnquiry(request):
    try:
        if request.session['aid'] is not None:
            records=Enquiry.objects.all()
            id=request.GET['id']
            e=Enquiry.objects.get(id=id)
            e.delete()
            return render(request, 'admEnquiry.html', {'msg': 'Enquiry Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def admFeedback(request):
    try:
        if request.session['aid'] is not None:
            f = Feedback.objects.all()
            return render(request, 'admFeedback.html', {'data': f})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delFeedback(request):
    try:
        if request.session['aid'] is not None:
            records=Feedback.objects.all()
            id=request.GET['id']
            f=Feedback.objects.get(id=id)
            f.delete()
            return render(request, 'admFeedback.html', {'msg': 'Feedback Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def sendEmail(request):
    try:
        if request.session['aid'] is not None:
            data=Email.objects.all()
            if request.method=='POST':
                to=request.POST['to']
                subject=request.POST['subject']
                txt=request.POST['mail-msg']
                dt=datetime.datetime.now()
                em=Email(to=to,subject=subject,txt=txt,dt=dt)
                em.save()

                # Email Code.............
                msg=MIMEMultipart()
                pwd='aah@to@sahi'
                msg['From']='shubhamjais1999@gmail.com'
                msg['To']=to
                msg['Subject']=subject
                msg.attach(MIMEText(txt, 'plain'))
                server=smtplib.SMTP('smtp.gmail.com:587')
                server.starttls()
                server.login(msg['From'], pwd)
                server.sendmail(msg['from'], msg['to'], msg.as_string())
                server.quit()
                return render(request, 'sendEmail.html', {'msg': 'Email send successffully.', 'data': data })
            else:
                return render(request, 'sendEmail.html', {'data': data })
    except Exception as e:
        print(e)
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delEmail(request):
    try:
        if request.session['aid'] is not None:
            records=Email.objects.all()
            id=request.GET['id']
            e=Email.objects.get(id=id)
            e.delete()
            return render(request, 'sendEmail.html', {'msg': 'Email Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def sendSMS(request):
    data=SMS.objects.all()
    try:
        if request.session['aid'] is not None:
            data=SMS.objects.all()
            if request.method=='POST':
                nmobno=request.POST['mobno']
                msg=request.POST['msg']
                nmsg=urllib.request.quote(msg)
                dt=datetime.datetime.now()
                sms=SMS(mobno=nmobno, msg=msg, dt=dt)
                sms.save()

                # SMS Code
                api="http://t.160smsalert.com/submitsms.jsp?user=kkmishra&key=5a78c161adXX&mobile={}&message={}&senderid=TXTSMS&accusage=1"
                napi=api.format(nmobno, nmsg)
                res=urllib.request.urlopen(napi)
                return render(request, 'sendSMS.html', {'msg': 'SMS send Succesfully', 'data':data})
            else:
                return render(request, 'sendSMS.html',  { 'data':data })
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delSMS(request):
    try:
        if request.session['aid'] is not None:
            records=SMS.objects.all()
            id=request.GET['id']
            s=SMS.objects.get(id=id)
            s.delete()
            return render(request, 'sendSMS.html', {'msg': 'Message Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def admProfile(request):
    try:
        if request.session['aid'] is not None:
            return render(request, 'admProfile.html')
    except:
        print(e)
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def changeAdmPassword(request):
    try:
        if request.session['aid'] is not None:
            if request.method=='POST':
                oldPwd=request.POST['pwd']
                npass=request.POST['npass']
                id=request.session['aid']
                enc=Encryption()
                l=AdmLogin.objects.all().filter(email=id, pwd=enc.encryptMyData(oldPwd))
                count=0
                for i in l:
                    count=count+1
                if count==1:
                    log=AdmLogin.objects.filter(email=id)
                    log.update(pwd=enc.encryptMyData(npass))
                    return render(request, 'changeAdmPassword.html', {'msg': 'Password changed successfully.'})
                else:
                    return render(request, 'changeAdmPassword.html', {'msg': 'Please enter correct Password.'})
            else:
                return render(request, 'changeAdmPassword.html')
    except Exception as e:
        print(e)
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def admDiscussion(request):
    try:
        if request.session['aid'] is not None:
            id=request.session['aid']
            d=Question.objects.all()
            if request.method == 'POST':
                question = request.POST['question']
                dt=datetime.datetime.now()
                try:
                    file=request.FILES['img']
                    r=random.randrange(9999999)
                    fname='Media/userpictures/'+str(r)+file.name
                    with open(fname, 'wb+') as myfile:
                        for i in file.chunks():
                            myfile.write(i)
                except:
                    fname=''
                q=Question(email=id, question=question, imgname=fname, dt=dt)
                q.save()
                return render(request, 'admDiscussion.html', {'msg': 'Question submitted succesfully.', 'data': d})
            else:
                return render(request, 'admDiscussion.html', {'data': d})
    except:
        return render(request, 'admLogin.html')

def admReply(request):
    try:
        if request.session['aid'] is not None:
            id=request.session['aid']
            if request.method == 'POST':
                qid=request.POST['qid']
                answer = request.POST['answer']
                dt=datetime.datetime.now()
                try:
                    file=request.FILES['img']
                    r=random.randrange(9999999)
                    fname='Media/userpictures/'+str(r)+file.name
                    with open(fname, 'wb+') as myfile:
                        for i in file.chunks():
                            myfile.write(i)
                except:
                    fname=''
                ans=Answer(qid=qid, email=id, answer=answer, imgname=fname, dt=dt)
                ans.save()
                return render(request, 'admReply.html', {'msg': 'Answer submitted succesfully.', 'qid': qid})
            else:
                qid=request.GET['qid']
                return render(request, 'admReply.html', {'qid': qid})
    except:
        return render(request, 'admLogin.html')
    
def admViewAnswer(request):
    qid=request.GET['qid']
    ans=Answer.objects.all().filter(qid=qid)
    return render(request, 'admViewAnswer.html', {'data': ans})

def delQues(request):
    try:
        if request.session['aid'] is not None:
            records=Question.objects.all()
            qid=request.GET['qid']
            s=Question.objects.get(id=qid)
            s.delete()
            return render(request, 'admDiscussion.html', {'msg': 'Question Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delAns(request):
    try:
        if request.session['aid'] is not None:
            records=Answer.objects.all()
            id=request.GET['id']
            a=Answer.objects.get(id=id)
            a.delete()
            return render(request, 'admViewAnswer.html', {'msg': 'Answer Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def addQP(request):
    try:
        if request.session['aid'] is not None:
            if request.method == 'POST':
                subject=request.POST['subject']
                date=request.POST['date']
                time=request.POST['time']
                tq=request.POST['tq']
                udt=datetime.datetime.now()
                paperid="QP"+str(random.randrange(999999999))
                qp=QPDetails(subject=subject, date=date, time=time, tq=tq, udt=udt, status='false', paperid=paperid)
                qp.save()
                return render(request, 'insertQ.html', {'msg': 'Question paper created succesfully, Please insert Questions here.', 'qpid':paperid, 'tq':range(int(tq)), 'totalquestion': tq})
            else:
                return render(request, 'addQP.html')
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def insertQ(request):
    try:
        if request.session['aid'] is not None:
            if request.method == 'POST':
                qpid=request.POST['qpid']
                totalquestion=int(request.POST['totalquestion'])
                for i in range(totalquestion):
                    question=request.POST['question' + str(i)]
                    a=request.POST['a' + str(i)]
                    b=request.POST['b' + str(i)]
                    c=request.POST['c' + str(i)]
                    d=request.POST['d' + str(i)]
                    ans=request.POST['ans' + str(i)]
                    q=ExamQuestion(paperid=qpid, question=question, a=a, b=b, c=c, d=d, ans=ans)
                    q.save()
                return render(request, 'admDashboard.html', {'msg': 'Record submitted succesfully.'})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def manageQP(request):
    try:
        if request.session['aid'] is not None:
            if request.method == 'POST':
                return render(request, 'manageQP.html', {'msg': 'Record submitted succesfully.'})
            else:
                qp=QPDetails.objects.all()
            return render(request, 'manageQP.html', {'data': qp})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def setQP(request):
    try:
        if request.session['aid'] is not None:
            if request.method == 'POST':
                paperid=request.POST['change']
                qpd=QPDetails.objects.filter(status='true')
                qpd.update(status='false')
                qpd=QPDetails.objects.filter(paperid=paperid)
                qpd.update(status='true')
                qp=QPDetails.objects.all()
                return render(request, 'manageQP.html', {'msg': 'Record submitted succesfully.', 'data': qp})
            else:
                qp=QPDetails.objects.all()
            return render(request, 'manageQP.html', {'data': qp})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def manageResult(request):
    try:
        if request.session['aid'] is not None:
            if request.method == 'POST':
                paperid=request.POST['change']
                r=Result.objects.all().filter(paperid=paperid)
                return render(request, 'viewResult.html', {'data': r})
            else:
                qp=QPDetails.objects.all()
            return render(request, 'manageResult.html', {'data': qp})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def manageUpload(request):
    try:
        if request.session['aid'] is not None:
            data=Upload.objects.all()
            if request.method == 'POST':
                cat=request.POST['cat']
                title=request.POST['title']
                des=request.POST['des']
                file=request.FILES['doc']
                r=random.randrange(9999999)
                fname='Media/userpictures/'+str(r)+file.name
                with open(fname, 'wb+') as myfile:
                    for i in file.chunks():
                        myfile.write(i)
                dt=datetime.datetime.now()
                u=Upload(category=cat, title=title, description=des, fname=fname, dt=dt)
                u.save()
                return render(request, 'manageUpload.html', {'msg': 'Record uploaded succesfully.', 'data': data})
            else:
                return render(request, 'manageUpload.html', {'data': data})
    except Exception as e:
        print(e)
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delUpload(request):
    try:
        if request.session['aid'] is not None:
            records=Upload.objects.all()
            id=request.GET['id']
            u=Upload.objects.get(id=id)
            u.delete()
            return render(request, 'manageUpload.html', {'msg': 'Document Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})

def delResult(request):
    try:
        if request.session['aid'] is not None:
            id=request.GET['id']
            r=Result.objects.all().filter(paperid=id)
            r.delete()
            records=QPDetails.objects.all()
            return render(request, 'manageResult.html', {'msg': 'Result Deleted Successsfully.', 'data':records})
    except:
        return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def delQP(request):
    try:
        if request.session['aid'] is not None:
            id=request.GET['id']
            q=QPDetails.objects.all().filter(paperid=id)
            q.delete()
            qp=ExamQuestion.objects.all().filter(paperid=id)
            qp.delete()
            records=QPDetails.objects.all()
            return render(request, 'manageQP.html', {'msg': 'Question Paper Deleted Successfully.', 'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})
        
def submittedTask(request):
    try:
        if request.session['aid'] is not None:
            records=Assignment.objects.all()
            return render(request, 'submittedTask.html', {'data':records})
    except:
        return render(request, 'admLogin.html', {'msg': 'Please login to visit this page.'})