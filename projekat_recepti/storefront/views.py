from django.shortcuts import get_object_or_404, render, redirect
from .models import RatingRecepta, Recepti, Korisnik, Komentari, ReceptiSteps
from .forms import CreateUserForm, EditUserProfileForm, EditUserPictureForm, KomentariForm, ReceptiForm, SastojciFormset, Sastojci, ReceptiStepsForm, updateSastojkeForm, StepsFormset
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.core.paginator import Paginator
from django.db.models import Sum
from django.db.models import Q

from django.template.loader import render_to_string
from django.http import JsonResponse
import json
from django.core import serializers
from django.template import loader, RequestContext

#PDF FILES IMPORT 
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa
from django.db.models import Avg

def home_view(request):
    # PAGINATION 
    p = Paginator(Recepti.objects.all().order_by("id"), 6)
    page = request.GET.get('page')
    listaRecepata = p.get_page(page)

    # END OF PAGINATION 
    if request.user.is_authenticated:
        currentCommUser = request.user.id
        trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
        user_favourites= trenutniKorisnik.favourites.all()

        # FILTER OPTIONS WITH SELECT
        # dropdown = request.GET.get('sortby')
        # is_dropdown = False
        # if dropdown:
        #     if dropdown == "zadnje_dodato":
        #         print("ZADNJE DODATO")
        #         dropdown_result = Recepti.objects.all().order_by('-datum_objave')
        #         is_dropdown = True
        #         return render (request,"home_main.html", {"dropdown_result": dropdown_result, "is_dropdown":is_dropdown})

        #     elif dropdown == "ocjena_jela":
        #         print("OCJENA JELA")
        #         dropdown_result = Recepti.objects.all().order_by('-ocjena_jela')
        #         is_dropdown = True
        #         return render (request,"home_main.html", {"dropdown_result": dropdown_result, "is_dropdown":is_dropdown})
        #     else:
        #         print("TRENDING")
        # print(request.is_ajax)
        # if request.is_ajax() and request.method == "GET":
        #     is_dropdown = False
        #     print(request.is_ajax, "OVO JE AJAX")
        #     print(request.method, "OVO JE GET METODA")
            
        #     dropdownOdabir = request.GET.get("word")
        #     if dropdownOdabir == "zadnje_dodato":
        #         allr = list(Recepti.objects.all().order_by('-datum_objave'))
        #         # print(allr)
        #         t = loader.get_template('home/main.html')
        #         html = t.render({'allr': allr})
        #         return HttpResponse(json.dumps({'html': html}))
                
                # return JsonResponse({'data':json_str}, status=200)
                # return HttpResponse(allr)

        # SEARCHBOX RESULTS 
        try:
            result = request.GET.get('q')
        except:
            result = None

        is_searched = False
        if result is not None:
            search_result = Recepti.objects.filter(naziv__icontains=result)
            is_searched=True
            return render (request,"home/main.html", {"search_result": search_result, "user_favourites":user_favourites, "is_searched":is_searched})
        
        # END OF SEARCHBOX
        return render (request,"home/main.html", {"allr": listaRecepata, "user_favourites":user_favourites})
    else:
        return render (request,"home/main.html", {"allr": listaRecepata})

def contact_view(request):
    return render(request,"contact.html")
def recipes_view(request):
    recept = Recepti.objects.all()
    featuredRecipes = Recepti.objects.all().order_by('-datum_objave')[:6]
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
        return render (request,"recipes/recipes_main.html",{"search_result":search_result, "featuredRecipes": featuredRecipes, "is_searched":is_searched, "user_favourites": user_favourites})
    context = {
        "recept" : recept,
        "featuredRecipes" : featuredRecipes,
        "user_favourites" : user_favourites
    }
    return render (request,"recipes/recipes_main.html",context)

def users_view(request,id):
    user = Korisnik.objects.get(id=id)
    userRecipes = Recepti.objects.filter(user_id=id)
    userComments = Komentari.objects.filter(user_id = id)

    context = {
        "displayUser":user,
        "userRecipes":userRecipes,
        "userComments":userComments,
    }

    return render (request, "account/profiles.html", context)

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


    ratingCheck = RatingRecepta.objects.filter(Q(recept_id=id), Q(user_id=currentCommUser))
    
    is_rated = True
    if ratingCheck:
        is_rated = False

    # print(ratingCheck)



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
        "is_rated":is_rated,
    }
    return render (request,"recipes/meal_template.html",context)

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
            # userRecipesCount = Recepti.objects.all().filter(user_id=userSearch.id)
            # print(userRecipesCount, "bROJ KORISNIKOVIH RECEPATA")
            rezultat_qs = []
            for x in userSearch:
                rezultat = Recepti.objects.filter(user_id=x.id)
                rezultat_qs.append(rezultat)
            context ={
                'user_search':userSearch,
                'recipe_search':recipeSearch,
                'rezultat_qs':rezultat_qs,
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

        return render (request,"account/account.html",{'account_form':account_update, 'avatar_form':avatar_update})

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


        return render (request,"account/edit_account.html",{'account_form':account_update, 'avatar_form':avatar_update})

  
def favourite_recipes_view(request):
    userid = request.user.id
    favourites = Korisnik.objects.get(user_id = userid)

    currentCommUser = request.user.id
    trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
    user_favourites= trenutniKorisnik.favourites.all()
    return render (request, "account/favourites.html", {"favourites":favourites,"user_favourites":user_favourites})


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
    return render (request, "account/myrecipes.html", {"myrecipes":my_recipes})


def adding_recipes_view(request):
    currentRecipeUser = Korisnik.objects.get(user=request.user)
    # print(request.GET, "GET METODA")

    if request.method == "POST":
        form = ReceptiForm(request.POST, request.FILES)
        formset = SastojciFormset(request.POST or None)
        rteformset = StepsFormset(request.POST or None)


        if form.is_valid() and formset.is_valid() and rteformset.is_valid():
            instance = form.save(commit=False)
            instance.user = currentRecipeUser
            instance.save()
            
            for fs_item in formset:
                child = fs_item.save(commit=False)
                if child.recept_id is None:
                    child.recept_id = instance
                child.save()

            for step in rteformset:
                secondChild = step.save(commit=False)
                if secondChild.recept_id is None:
                    secondChild.recept_id = instance.id
                secondChild.save()
            
            # ReceptiSteps.objects.create(recept_id=secondChild.recept_id, body=secondChild.body)
            messages.success(request, "Uspješno ste dodali recept!")
            
            return redirect('myrecipes')
    else:
        form = ReceptiForm()
        formset = SastojciFormset()
        rteformset = StepsFormset()
        
        
    context ={
        "form":form,
        "formset":formset,
        "rteformset":rteformset,
    }

    return render (request,"recipes/add_recipe.html",context)

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

    return render(request, "recipes/update_single_recipe.html", context)

def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        user = authenticate(request, username=username, password=password)

        if user is not None:
            login(request, user)
            messages.success(request, "Uspjesno ste se logirali")
            # return HttpResponseRedirect('account')
            return redirect('account')
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

    template_path = 'recipes/recept_pdf.html'
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


def rate_recipes(request,id):
    currentUser = request.user.id
    if request.method == 'POST':
        recept = Recepti.objects.get(id=id)
        korisnik = Korisnik.objects.get(id=currentUser)

        if "first" in request.POST:
            RatingRecepta.objects.create(recept=recept, user=korisnik, rating=1)
        elif "second" in request.POST:
            RatingRecepta.objects.create(recept=recept, user=korisnik, rating=2)
        elif "third" in request.POST:
            RatingRecepta.objects.create(recept=recept, user=korisnik, rating=3)
        elif "fourth" in request.POST:
            RatingRecepta.objects.create(recept=recept, user=korisnik, rating=4)
        else:
            RatingRecepta.objects.create(recept=recept, user=korisnik, rating=5)

        # el_id = request.POST.get('el_id')
        # val = request.POST.get('val')
        # recept = Recepti.objects.get(id=el_id)
        # recept = Recepti.objects.get(id=id)
        # print(recept)

        # korisnik = Korisnik.objects.get(id=currentUser)
        # RatingRecepta.objects.create(recept=recept, user=korisnik, rating=val)
        # return JsonResponse({'success':'true', 'rating': val}, safe=False)
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    return JsonResponse({'success':'false'})