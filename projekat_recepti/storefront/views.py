from django.shortcuts import render, redirect
from .models import Recepti
from django.contrib.auth.forms import UserCreationForm
from .forms import CreateUserForm
from django.contrib.auth import authenticate, login, logout

from django.contrib import messages
import time

# Create your views here.
def home_view(request):
    listaRecepata = Recepti.objects.all()
    return render (request,"home_main.html", {"allr": listaRecepata})

def recipes_view(request):
    recept = Recepti.objects.all()
    return render (request,"recipes_main.html",{'recept': recept})

def jelo_view(request,id):
    obj = Recepti.objects.get(id = id)
    svi_recepti = Recepti.objects.all()
    sastojci = obj.nacin_pripreme_id.sastojak_id.all()
    return render (request,"meal_template.html",{"object": obj, "svi_recepti":svi_recepti,"sastojak":sastojci})
    # item = get_object_or_404(Recepti, id=id)
    # return render (request,"meal_template.html",{"item": item})


def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            time.sleep(0.3)
            return redirect('home')
        else:
            messages.info(request, "Username or password is not correct")

    context = {}
    return render(request,"login.html",context)

def logout_view(request):
    logout(request)
    time.sleep(0.3)
    return redirect('login')

def register_view(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)
        if form.is_valid():
            form.save()
            
            user = form.cleaned_data.get("username")

            messages.success(request, "Account created for " + user)

            return redirect('receptiapp/login')

    context = {'form':form}
    return render(request,"register.html",context)