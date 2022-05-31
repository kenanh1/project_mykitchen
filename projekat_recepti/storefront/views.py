from django.shortcuts import render, redirect
from .models import Recepti, Korisnik, Komentari, ReceptiSteps
from .forms import CreateUserForm, EditUserProfileForm, EditUserPictureForm, KomentariForm, ReceptiForm, SastojciFormset, Sastojci, ReceptiStepsForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required


def home_view(request):
    listaRecepata = Recepti.objects.all()
    return render (request,"home_main.html", {"allr": listaRecepata})

def recipes_view(request):
    recept = Recepti.objects.all()
    return render (request,"recipes_main.html",{'recept': recept})


def jelo_view(request,id):
    obj = Recepti.objects.get(id = id)
    svi_recepti = Recepti.objects.all()
    userRecipes = Recepti.objects.filter(user_id = obj.user_id).count()
    allSteps = ReceptiSteps.objects.filter(recept_id = id)
    ingredientsList = Sastojci.objects.filter(recept_id = id)
    svi_komentari = Komentari.objects.filter(recept_id = id)
    commCount = svi_komentari.count()
    currentCommUser = request.user.id
    print(allSteps)


    stepForma = CreateUserForm()
    commentForm = KomentariForm(request.POST)
    if request.method == "POST":
        if commentForm.is_valid():
            commDetail = commentForm.save(commit=False)
            commDetail.user_id = currentCommUser
            commDetail.recept_id = id
            commDetail.save()
            return redirect('account')


    context = {
        "object": obj,
        "svi_recepti":svi_recepti,
        "all_ingredients":ingredientsList,
        "userRecipes":userRecipes,
        "step_form":stepForma,
        "comment_form": commentForm,
        "all_comments": svi_komentari,
        "comm_counter": commCount,
        "recipe_steps":allSteps,
    }
    return render (request,"meal_template.html",context)


@login_required
def account_view(request):
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
    return render (request, "account_recipes.html", {"myrecipes":my_recipes})


def adding_recipes_view(request):
    currentRecipeUser = Korisnik.objects.get(user=request.user)

    form = ReceptiForm(request.POST, request.FILES)
    formset = SastojciFormset(request.POST or None)
    steps_formset = ReceptiStepsForm(request.POST , request.FILES)
    if request.method == "POST":
        if form.is_valid() and formset.is_valid():
            instance = form.save(commit=False)
            instance.user = currentRecipeUser
            instance.save()

            for fs_item in formset:
                child = fs_item.save(commit=False)
                if child.recept_id is None:
                    child.recept_id = instance
                    print(child.recept_id)
                child.save()

            for fs_step in steps_formset:
                child2 = fs_step.save(commit=False)
                if child2.recept_id is None:
                    child2.recept_id = instance
                    print(child2.recept_id)
                child2.save()

            messages.success(request, "Uspjesno ste dodali novi recept")
            return redirect('myrecipes')
    else:
        form = ReceptiForm()
        formset = SastojciFormset()
        
        
    context ={
        "form":form,
        "formset":formset,
        "steps_formset":steps_formset,
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