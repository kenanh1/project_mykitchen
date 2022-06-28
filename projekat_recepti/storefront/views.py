from operator import is_
from django.shortcuts import get_object_or_404, render, redirect
from .models import Recepti, Korisnik, Komentari, ReceptiSteps
from .forms import CreateUserForm, EditUserProfileForm, EditUserPictureForm, KomentariForm, ReceptiForm, SastojciFormset, Sastojci, ReceptiStepsForm, updateSastojkeForm
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.core.paginator import Paginator

#PDF FILES IMPORT 
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa


def home_view(request):
    # listaRecepata = Recepti.objects.all()
    # PAGINATION 
    p = Paginator(Recepti.objects.all(), 6)
    page = request.GET.get('page')
    listaRecepata = p.get_page(page)

    # END OF PAGINATION 
    if request.user.is_authenticated:
        currentCommUser = request.user.id
        trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
        user_favourites= trenutniKorisnik.favourites.all()

        # FILTER OPTIONS WITH SELECT
        dropdown = request.GET.get('sortby')
        is_dropdown = False
        if dropdown:
            if dropdown == "zadnje_dodato":
                print("ZADNJE DODATO")
                dropdown_result = Recepti.objects.all().order_by('-datum_objave')
                is_dropdown = True
                return render (request,"home_main.html", {"dropdown_result": dropdown_result, "is_dropdown":is_dropdown})

            elif dropdown == "ocjena_jela":
                print("OCJENA JELA")
                dropdown_result = Recepti.objects.all().order_by('-ocjena_jela')
                is_dropdown = True
                return render (request,"home_main.html", {"dropdown_result": dropdown_result, "is_dropdown":is_dropdown})
            else:
                print("TRENDING")

        # SEARCHBOX RESULTS 
        # searched = request.GET.get('q')
        try:
            result = request.GET.get('q')
        except:
            result = None

        is_searched = False
        if result is not None:
            search_result = Recepti.objects.filter(naziv__icontains=result)
            is_searched=True
            return render (request,"home_main.html", {"search_result": search_result, "user_favourites":user_favourites, "is_searched":is_searched})
        
        # END OF SEARCHBOX
        return render (request,"home_main.html", {"allr": listaRecepata, "user_favourites":user_favourites})
    else:
        return render (request,"home_main.html", {"allr": listaRecepata})

def recipes_view(request):
    recept = Recepti.objects.all()
    featuredRecipes = Recepti.objects.all().order_by('-ocjena_jela')[:6]
    searched = request.GET

    currentCommUser = request.user.id
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    user_favourites= trenutniKorisnik.favourites.all()

    try:
        result = searched.get('q')
    except:
        result = None

    is_searched = False
    if result is not None:
        search_result = Recepti.objects.filter(naziv__icontains=result)
        is_searched=True
        return render (request,"recipes_main.html",{"search_result":search_result, "featuredRecipes": featuredRecipes, "is_searched":is_searched, "user_favourites": user_favourites})
    context = {
        "recept" : recept,
        "featuredRecipes" : featuredRecipes,
        "user_favourites" : user_favourites
    }
    return render (request,"recipes_main.html",context)

def users_view(request,id):
    user = Korisnik.objects.get(id=id)
    userRecipes = Recepti.objects.filter(user_id=id)
    userComments = Komentari.objects.filter(user_id = id)

    context = {
        "displayUser":user,
        "userRecipes":userRecipes,
        "userComments":userComments,
    }

    return render (request, "users-index.html", context)

def jelo_view(request,id):
    obj = Recepti.objects.get(id = id)
    svi_recepti = Recepti.objects.all()[:8]
    userRecipes = Recepti.objects.filter(user_id = obj.user_id).count()
    allSteps = ReceptiSteps.objects.filter(recept_id = id)
    ingredientsList = Sastojci.objects.filter(recept_id = id)
    svi_komentari = Komentari.objects.filter(recept_id = id)
    commCount = svi_komentari.count()
    currentCommUser = request.user.id
    commentForm = KomentariForm(request.POST)
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    tezinaPripreme = int(obj.tezina_pripreme)
    svi_korisnici = Korisnik.objects.all()

    #TEST ZA FAVOURITES
    is_favourite = False
    if trenutniKorisnik.favourites.filter(id=obj.id):
        is_favourite = True

    if request.method == "POST":
        commentForm = KomentariForm(data=request.POST)
        if commentForm.is_valid():
            parent_obj = None
            try:
                parent_id = int(request.POST.get("parent_id"))
            except:
                parent_id=None

            if parent_id:
                parent_obj = Komentari.objects.get(id = parent_id)
                if parent_obj:
                    replay_comment = commentForm.save(commit=False)
                    replay_comment.parent = parent_obj
                    replay_comment.user_id = trenutniKorisnik.id
            commDetail = commentForm.save(commit=False)
            commDetail.user_id = currentCommUser
            commDetail.recept_id = id
            commDetail.save()
            return HttpResponseRedirect(request.path_info)


    context = {
        "object": obj,
        "svi_recepti":svi_recepti,
        "all_ingredients":ingredientsList,
        "userRecipes":userRecipes,
        "comment_form": commentForm,
        "all_comments": svi_komentari,
        "comm_counter": commCount,
        "recipe_steps":allSteps,
        "authorid" : trenutniKorisnik,
        "tezina_pripreme": range(tezinaPripreme),
        "svi_korisnici": svi_korisnici,
        "is_favourite":is_favourite,
    }
    return render (request,"meal_template.html",context)

def recipe_search_view(request):
    if request.method == "GET":
        full_search = request.GET.get('pretraga')
        
        try:
            full_search = request.GET.get('pretraga')
        except:
            full_search = None
        
        is_fullsearch = False

        if full_search:
            userSearch = Korisnik.objects.all().filter( user__username__icontains=full_search )
            recipeSearch = Recepti.objects.all().filter( naziv__icontains = full_search)
            print(userSearch, "USEEEEEEEEEEER")
            print(recipeSearch, "RECEEPPTI")
            context ={
                'user_search':userSearch,
                'recipe_search':recipeSearch,
            }

            return render(request,"search.html", context)
        return render(request,"search.html")


def delete_comment(request,pk):
    id = request.POST['comment_id']
    komentar = get_object_or_404(Komentari, id=id)
    post = Recepti.objects.get(id=komentar.recept_id)

    if request.method == "POST":
        komentar = get_object_or_404(Komentari, id=id)
        try:
            komentar.delete()
            messages.success(request, 'You have successfully deleted the comment')

        except:
            messages.warning(request, 'The comment could not be deleted.')


    return redirect('jelo',id=post.id)

def add_likes(request, pk):
    currentCommUser = request.user.id
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    komentar = get_object_or_404(Komentari, id=request.POST.get("komentar_id"))
    post = Recepti.objects.get(id=komentar.recept_id)

    
    is_dislike = False

    for dislike in komentar.dislikes.all():
        if dislike == trenutniKorisnik:
            is_dislike = True
            break

    if is_dislike:
        komentar.dislikes.remove(trenutniKorisnik.id)

    is_like = False

    for like in komentar.likes.all():
        if like == trenutniKorisnik:
            is_like = True
            break
        

    if not is_like:
        komentar.likes.add(trenutniKorisnik.id)

    if is_like:
        komentar.likes.remove(trenutniKorisnik.id)

    return redirect('jelo',id=post.id)


def add_dislikes(request,pk):
    currentCommUser = request.user.id
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    komentar = get_object_or_404(Komentari, id=request.POST.get("komentar_id"))
    post = Recepti.objects.get(id=komentar.recept_id)

    is_like = False

    for like in komentar.likes.all():
        if like == trenutniKorisnik:
            is_like = True
            break

    if is_like:
        komentar.likes.remove(trenutniKorisnik.id)

    is_dislike = False

    for dislike in komentar.dislikes.all():
        if dislike == trenutniKorisnik:
            is_dislike = True
            break

    if not is_dislike:
        komentar.dislikes.add(trenutniKorisnik.id)

    if is_dislike:
        komentar.dislikes.remove(trenutniKorisnik.id)

    return redirect('jelo',id = post.id )

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

  
def favourite_recipes_view(request):
    userid = request.user.id
    favourites = Korisnik.objects.get(user_id = userid)

    currentCommUser = request.user.id
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    user_favourites= trenutniKorisnik.favourites.all()
    return render (request, "saved_recipes.html", {"favourites":favourites,"user_favourites":user_favourites})


def add_favourite_view(request, id):
    currentCommUser = request.user.id
    korisnik = Korisnik.objects.get(user_id = currentCommUser)
    is_favourite = False
    if korisnik.favourites.filter(id = id).exists():
        korisnik.favourites.remove(id)
        messages.warning(request, "Uspješno ste uklonili recept iz favorita.")
        is_favourite = False
    else:
        korisnik.favourites.add(id)
        messages.success(request, "Uspješno ste dodali recept u favorite.")
        is_favourite = True
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    

def my_recipes_view(request):
    current_user = request.user.id
    my_recipes = Recepti.objects.filter(user_id = current_user)
    return render (request, "account_recipes.html", {"myrecipes":my_recipes})


def adding_recipes_view(request):
    currentRecipeUser = Korisnik.objects.get(user=request.user)

    if request.method == "POST":
        form = ReceptiForm(request.POST, request.FILES)
        formset = SastojciFormset(request.POST or None)
        rteformset = ReceptiStepsForm(request.POST or None)


        if form.is_valid() and formset.is_valid() and rteformset.is_valid():
            instance = form.save(commit=False)
            instance.user = currentRecipeUser
            instance.save()
            

            for fs_item in formset:
                child = fs_item.save(commit=False)
                if child.recept_id is None:
                    child.recept_id = instance
                child.save()

            stepsForm = rteformset.save(commit=False)
            if stepsForm.recept_id is None:
                    stepsForm.recept_id = instance
            
            ReceptiSteps.objects.create(recept=stepsForm.recept_id, body=stepsForm.body)
            messages.success(request, "Uspješno ste dodali recept!")
            

            return redirect('myrecipes')
    else:
        form = ReceptiForm()
        formset = SastojciFormset()
        rteformset = ReceptiStepsForm()
        
        
    context ={
        "form":form,
        "formset":formset,
        "rteformset":rteformset,
    }

    return render (request,"add_recipe.html",context)

def update_recipes_view(request,id):
    recept = Recepti.objects.get(id = id)
    form = ReceptiForm(instance=recept)
    sastojci = Sastojci.objects.filter(recept_id=recept)
    rteformset = ReceptiStepsForm(instance=recept)

    context = {
        'form': form,
        'sastojci': sastojci,
        "rteformset" : rteformset,
    }

    return render(request, "update_single_recipe.html", context)

def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, "Uspjesno ste se logirali")
            return HttpResponseRedirect('/receptiapp/account/')
        else:
            messages.error(request, "Korisničko ime ili šifra nisu tačni.")

    context = {}
    return render(request,"login.html",context)

def logout_view(request):
    logout(request)
    messages.info(request, "Uspješno ste se odjavili.")
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


#PDF FUNCTIONS START

def render_pdf_view(request, id):
    id = id
    recept = get_object_or_404(Recepti, id=id)
    allSteps = ReceptiSteps.objects.filter(recept_id = id)
    ingredientsList = Sastojci.objects.filter(recept_id = id)

    template_path = 'recept_pdf.html'
    context = {'object': recept,'recipe_steps':allSteps, "all_ingredients":ingredientsList}
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = f'filename="{recept.naziv}.pdf"'
    template = get_template(template_path)
    html = template.render(context)
    pisa_status = pisa.CreatePDF(
       html, dest=response)
    if pisa_status.err:
       return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response


#PDF FUNCTIONS END