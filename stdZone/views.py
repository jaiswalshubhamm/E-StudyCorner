from django.shortcuts import render
from .models import Feedback, Question, Answer, Assignment
from estudy.models import Register, Login
from admZone.models import QPDetails, ExamQuestion, Result, Upload
from estudy.cryptography import Encryption
import random
import datetime

# Create your views here.
def stdDashboard(request):
    try:
        if request.session['id'] is not None:
            return render(request, 'stdDashboard.html')
    except:
            return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def stdFeedback(request):
    try:
        if request.session['id'] is not None:
            if request.method=='POST':
                name=request.POST['name']
                email=request.POST['email']
                contactnumber=request.POST['contactnumber']
                topic=request.POST['topic']
                feedback=request.POST['feedback']
                f=Feedback(name=name, email=email, mobno=contactnumber, topic=topic, feedback=feedback)
                f.save()
                return render(request, 'stdFeedback.html', {'msg': 'Feedback submitted successfully.'})
            else:
                return render(request, 'stdFeedback.html')
    except:
            return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def updateProfile(request):
    try:
        if request.session['id'] is not None:
            id=request.session['id']
            r=Register.objects.filter(email=id)
            if request.method=='POST':
                name=request.POST['name']
                gender=request.POST['gender']
                dob=request.POST['dob']
                mobno=request.POST['mobno']
                email=request.POST['email']
                address=request.POST['address']
                try:
                    file=request.FILES['img']
                    r=random.randrange(9999999)
                    fname='Media/userpictures/'+str(r)+file.name
                    with open(fname, 'wb+') as myfile:
                        for i in file.chunks():
                            myfile.write(i)
                except:
                    fname=request.POST['imgh']
                regUpdate=Register.objects.all().filter(email=id)
                regUpdate.update(name=name, gender=gender, dob=dob, email=email, mobno=mobno, picture=fname, address=address)
                return render(request, 'updateProfile.html', {'msg': 'Profile updated successfully.', 'data': regUpdate})
            else:
                return render(request, 'updateProfile.html', { 'data': r })
    except Exception as e:
        print(e)
        return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def changePassword(request):
    try:
        if request.session['id'] is not None:
            if request.method=='POST':
                oldPwd=request.POST['pwd']
                npass=request.POST['npass']
                id=request.session['id']
                enc=Encryption()
                l=Login.objects.all().filter(email=id, pwd=enc.encryptMyData(oldPwd))
                count=0
                for i in l:
                    count=count+1
                if count==1:
                    log=Login.objects.filter(email=id)
                    log.update(pwd=enc.encryptMyData(npass))
                    return render(request, 'changePassword.html', {'msg': 'Password changed successfully.'})
                else:
                    return render(request, 'changePassword.html', {'msg': 'Please enter correct Password.'})
            else:
                return render(request, 'changePassword.html')
    except:
        return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def stdFeedback(request):
    try:
        if request.session['id'] is not None:
            if request.method=='POST':
                name=request.POST['name']
                email=request.POST['email']
                contactnumber=request.POST['contactnumber']
                topic=request.POST['topic']
                feedback=request.POST['feedback']
                f=Feedback(name=name, email=email, mobno=contactnumber, topic=topic, feedback=feedback)
                f.save()
                return render(request, 'stdFeedback.html', {'msg': 'Feedback submitted successfully.'})
            else:
                return render(request, 'stdFeedback.html')
    except:
            return render(request, 'login.html', {'msg': 'Please login to visit this page.'})

def stdDiscussion(request):
    d=Question.objects.all()
    return render(request, 'stdDiscussion.html', {'data': d})

def questionUpload(request):
    try:
        if request.session['id'] is not None:
            id=request.session['id']
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
                return render(request, 'stdDiscussion.html', {'msg': 'Question submitted succesfully.', 'data': d})
            else:
                return render(request, 'stdDiscussion.html', {'data': d})
    except:
        return render(request, 'login.html')

def reply(request):
    try:
        if request.session['id'] is not None:
            id=request.session['id']
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
                d=Question.objects.all()
                return render(request, 'stdDiscussion.html', {'msg': 'Answer submitted succesfully.', 'qid': qid, 'data': d})
            else:
                qid=request.GET['qid']
                return render(request, 'stdReply.html', {'qid': qid})
    except:
        return render(request, 'login.html')
    
def viewAnswer(request):
    try:
        if request.session['id'] is not None:
            qid=request.GET['qid']
            ans=Answer.objects.all().filter(qid=qid)
        return render(request, 'stdViewAnswer.html', {'data': ans})
    except Exception as e:
        print(e)
        return render(request, 'login.html')

def examRules(request):
    try:
        if request.session['id'] is not None:
            return render(request, 'examRules.html')
    except:
        return render(request, 'login.html')

def test(request):
    try:
        if request.session['id'] is not None:
            try:
                qp=QPDetails.objects.all().filter(status='true')
                for i in qp:
                    paperid=i.paperid
                    tq=i.tq
                questions = ExamQuestion.objects.all().filter(paperid=paperid)
                return render(request, 'exam.html', {'questions': questions, 'tq':tq, 'paperid': paperid})
            except:
                return render(request, 'stdDiscussion.html', {'msg': 'No Exam are sheduled currently.'})
    except Exception as e:
        print(e)
        return render(request, 'login.html')

def result(request):
    try:
        if request.session['id'] is not None:
            if request.method=='POST':
                tq=int(request.POST['tq'])
                paperid=request.POST['paperid']
                email=request.session['id']
                l1=[]
                l2=[]
                uans=''
                for i in range(1, tq+1):
                    l1.append(request.POST[str(i)])
                    uans=uans+request.POST[str(i)]+","
                a=ExamQuestion.objects.all().filter(paperid=paperid)
                for i in a:
                    l2.append(i.ans)
                correct=0
                for x in range(tq):
                    if l1[x]==l2[x]:
                        correct=correct+1
                reg=Register.objects.all().filter(email=email)
                for i in reg:
                    name=i.name
                r=Result(paperid=paperid, name=name, email=email, tq=tq, correct=correct, ans=uans)
                r.save()
                return render(request, 'result.html', { 'tq':tq, 'correct': correct})
    except Exception as e:
        print(e)
        return render(request, 'login.html')

def studyMaterial(request):
    try:
        if request.session['id'] is not None:
            d=Upload.objects.all().filter(category='Study Material')
            return render(request, 'studyMaterial.html', {'data': d})
    except Exception as e:
        print(e)
        return render(request, 'login.html')

def assignments(request):
    try:
        if request.session['id'] is not None:
            d=Upload.objects.all().filter(category='Assignments')
            return render(request, 'assignments.html', {'data': d})
    except:
        return render(request, 'login.html')

def submitAssignment(request):
    try:
        if request.session['id'] is not None:
            email=request.session['id']
            records=Assignment.objects.all().filter(email=email)
            if request.method=='POST':
                title=request.POST['title']
                des=request.POST['des']
                dt=datetime.datetime.now()
                file=request.FILES['doc']
                r=random.randrange(9999999)
                fname='Media/userpictures/'+str(r)+file.name
                with open(fname, 'wb+') as myfile:
                    for i in file.chunks():
                        myfile.write(i)
                u=Register.objects.all().filter(email=email)
                uname=''
                for i in u:
                    uname=i.name
                a=Assignment(name=uname,email=email, title=title, description=des, dt=dt, doc=fname)
                a.save()
                return render(request, 'submitAssignment.html', {'data': records})
            else:
                return render(request, 'submitAssignment.html', {'data': records})
    except Exception as e:
        print(e)
        return render(request, 'login.html')

def stdCommon(request):
    try:
        email=request.session['id']
        reg=Register.objects.all().filter(email=email)
        return {'stdCommon': reg}
    except:
        email=''
        reg=Register.objects.all().filter(email=email)
        return {'stdCommon': reg}