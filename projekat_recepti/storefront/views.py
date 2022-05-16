from django.shortcuts import render, redirect
from .models import Recepti, Korisnik
from .forms import CreateUserForm, EditUserProfileForm, EditUserPictureForm, ReceptiForm, NacinpripemeForm, SastojciForm, SastojciFormset
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required


def home_view(request):
    listaRecepata = Recepti.objects.all()
    for item in listaRecepata:
        print(item)
    return render (request,"home_main.html", {"allr": listaRecepata})

def recipes_view(request):
    recept = Recepti.objects.all()
    return render (request,"recipes_main.html",{'recept': recept})

def jelo_view(request,id):
    obj = Recepti.objects.get(id = id)
    svi_recepti = Recepti.objects.all()
    sastojci = obj.nacin_pripreme_id.sastojak_id.all()
    return render (request,"meal_template.html",{"object": obj, "svi_recepti":svi_recepti,"sastojak":sastojci})

@login_required
def account_view(request):
    if request.method == "POST":
        account_update = EditUserProfileForm(request.POST, instance=request.user)
        avatar_update = EditUserPictureForm(request.POST, request.FILES, instance = request.user.korisnik)
        print(account_update, "TEST")
        
        if account_update.is_valid() and avatar_update.is_valid():
            account_update.save()
            avatar_update.save()
            
            messages.success(request, "Uspjesno ste promjenili Vase podatke na profilu.")
            return redirect('account')
    
    else:
        account_update = EditUserProfileForm(instance=request.user)
        avatar_update = EditUserPictureForm(instance=request.user.korisnik)


        return render (request,"account.html",{'account_form':account_update, 'avatar_form':avatar_update})

@login_required
def edit_account_view(request):
    if request.method == "POST":
        account_update = EditUserProfileForm(request.POST, instance=request.user)
        avatar_update = EditUserPictureForm(request.POST, request.FILES, instance = request.user.korisnik)
        
        if account_update.is_valid() and avatar_update.is_valid():
            account_update.save()
            avatar_update.save()
            
            messages.success(request, "Uspjesno ste promjenili Vase podatke na profilu.")
            return redirect('account')
    
    else:
        account_update = EditUserProfileForm(instance=request.user)
        avatar_update = EditUserPictureForm(instance=request.user.korisnik)


        return render (request,"edit_account.html",{'account_form':account_update, 'avatar_form':avatar_update})
    
def my_recipes_view(request):
    current_user = request.user.id

    my_recipes = Recepti.objects.filter(user_id = current_user)
    print(my_recipes)
    return render (request, "account_recipes.html", {"myrecipes":my_recipes})

def adding_recipes_view(request):
    form1 = ReceptiForm()
    form2 = NacinpripemeForm()
    form3 = SastojciFormset()

    context ={
        "form1":form1,
        "form2":form2,
        "form3":form3
    }

    return render (request,"add_recipe.html",context)

def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request, "Username or password is not correct")

    context = {}
    return render(request,"login.html",context)

def logout_view(request):
    logout(request)
    return redirect('login')

def register_view(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)

        if form.is_valid():
            new_user = form.save()
            
            Korisnik.objects.create(user=new_user)
            
            user_name = form.cleaned_data.get("username")

            messages.success(request, "Account created for " + user_name)

            return redirect('login')

    return render(request,"register.html",{'form':form})