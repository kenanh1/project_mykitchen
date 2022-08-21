from django.shortcuts import get_object_or_404, render, redirect
from .models import RatingRecepta, Recepti, Korisnik, Komentari, ReceptiSteps
from .forms import *
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.template.loader import render_to_string , get_template
from django.http import JsonResponse, HttpResponseRedirect, HttpResponse
from xhtml2pdf import pisa
from django.core.mail import send_mail

def home_view(request):
    #   >>> PAGINATION <<< 
    p = Paginator(Recepti.objects.all().order_by("id"), 9)
    page = request.GET.get('page')
    listaRecepata = p.get_page(page)
    #   >>> END OF PAGINATION <<<
    #   >>> AJAX <<<
    if request.is_ajax() and request.method == "GET":
            url_path = request.get_full_path()
            dropdownOdabir = request.GET.get("filter")
            currentUser = request.user.id
            trenutniKorisnik = Korisnik.objects.get(user_id = currentUser)
            user_favourites= trenutniKorisnik.favourites.all()

            if dropdownOdabir == "zadnje_dodato":
                sviRecepti = Recepti.objects.all().order_by('-datum_objave')
                t = render_to_string('recipes/meal_media_ajax.html',{'allr':sviRecepti, "user_favourites":user_favourites})
                return JsonResponse({'success': True, "path":url_path, "data":t}, status=201)

            elif dropdownOdabir == "ocjena_jela":
                sviRecepti = Recepti.objects.all()
                OrderedDict = (sorted(sviRecepti, reverse=True, key=lambda t: t.avg_rating()))
                t = render_to_string('recipes/meal_media_ajax.html',{'allr':OrderedDict})
                return JsonResponse({'success': True, "path":url_path, "data":t}, status=201)
            
            elif dropdownOdabir == "popularno":
                sviRecepti = Recepti.objects.all()
                OrderedDict = (sorted(sviRecepti, reverse=True, key=lambda t: t.total_votes()))
                t = render_to_string('recipes/meal_media_ajax.html',{'allr':OrderedDict})
                return JsonResponse({'success': True, "path":url_path, "data":t}, status=201)
    #   >>> END OF AJAX <<<
    
    if request.user.is_authenticated:
        currentUser = request.user.id
        trenutniKorisnik = Korisnik.objects.get(user_id = currentUser)
        user_favourites= trenutniKorisnik.favourites.all()

        #   >>> SEARCHBOX <<<
        try:
            result = request.GET.get('q')
        except:
            result = None

        is_searched = False
        if result is not None:
            search_result = Recepti.objects.filter(naziv__icontains=result)
            is_searched=True
            return render (request,"home/main.html", {"search_results": search_result, "user_favourites":user_favourites, "is_searched":is_searched})
        #   >>> END OF SEARCHBOX <<<

        return render (request,"home/main.html", {"allr": listaRecepata, "user_favourites":user_favourites})
    else:
        return render (request,"home/main.html", {"allr": listaRecepata})


def contact_view(request):
    form = ContactForm()
    if request.method == "POST":
        name = request.POST.get('name')
        mail = request.POST.get('email')
        msg = request.POST.get('message')

        message = f'''
        Ime : {name}
        e-mail : {mail}

        Poruka : {msg}
        '''
        send_mail("Moja kontakt forma", message, '', ['info.mojakuhinja@gmail.com'])
        # messages.success(request, "Uspješno ste poslali poruku.")

        return render(request,"contact.html",{'form':form})

    else:
        return render(request,"contact.html",{'form':form})

def recipes_view(request):
    recept = Recepti.objects.all()
    featuredRecipes = Recepti.objects.all()
    orderedFeaturedRecipes = (sorted(featuredRecipes, reverse=True, key=lambda t: t.avg_rating()))[:6]

    if request.user.is_authenticated:
        currentCommUser = request.user.id
        trenutniKorisnik = Korisnik.objects.get(user_id = currentCommUser)
        user_favourites= trenutniKorisnik.favourites.all()

        try:
            result = request.GET.get('q')
        except:
            result = None

            is_searched = False
            if result is not None:
                search_result = Recepti.objects.filter(naziv__icontains=result)
                is_searched=True
                return render (request,"recipes/recipes_main.html",{"search_result":search_result, "featuredRecipes": featuredRecipes, "is_searched":is_searched, "user_favourites": user_favourites})
        return render (request,"recipes/recipes_main.html",{"recept" : recept,"featuredRecipes" : orderedFeaturedRecipes, "user_favourites": user_favourites})
    return render (request,"recipes/recipes_main.html",{"recept" : recept,"featuredRecipes" : orderedFeaturedRecipes})


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
    commentForm = KomentariForm(request.POST)
    tezinaPripreme = int(obj.tezina_pripreme)
    svi_korisnici = Korisnik.objects.all()

    if request.user.is_authenticated:
        currentUser = request.user.id
        trenutniKorisnik = Korisnik.objects.get(user_id = currentUser)
        ratingCheck = RatingRecepta.objects.filter(Q(recept_id=id), Q(user_id=currentUser))
    
        is_rated = True
        if ratingCheck:
            is_rated = False

        #   >>> FAVOURITES <<<
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
                commDetail.user_id = currentUser
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


    context = {
        "object": obj,
        "svi_recepti":svi_recepti,
        "all_ingredients":ingredientsList,
        "userRecipes":userRecipes,
        "comment_form": commentForm,
        "all_comments": svi_komentari,
        "comm_counter": commCount,
        "recipe_steps":allSteps,
        "tezina_pripreme": range(tezinaPripreme),
        "svi_korisnici": svi_korisnici,
    }
    return render (request,"recipes/meal_template.html",context)

def recipe_search_view(request):
    if request.method == "GET":
        full_search = request.GET.get('pretraga')
        
        try:
            full_search = request.GET.get('pretraga')
        except:
            full_search = None
        
        if full_search:
            userSearch = Korisnik.objects.all().filter( user__username__icontains=full_search )
            recipeSearch = Recepti.objects.all().filter( naziv__icontains = full_search)
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
    return render (request,"account/account.html",)

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
            
            ReceptiSteps.objects.create(recept_id=secondChild.recept_id, body=secondChild.body)
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


#   >>> REGISTER / LOGIN / LOGOUT <<<
def register_view(request):
    form = CreateUserForm()
    if request.method == "POST":
        form = CreateUserForm(request.POST)

        if form.is_valid():
            new_user = form.save()
            Korisnik.objects.create(user=new_user)
            messages.success(request, "Molimo unesite podatke za prijavu.")
            return redirect('login')

    return render(request,"register.html",{'form':form})

def login_view(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "Uspješno ste se prijavili.")
            return redirect('account')
        else:
            messages.error(request, "Korisničko ime ili šifra nisu tačni.")

    return render(request,"login.html")

def logout_view(request):
    logout(request)
    messages.info(request, "Uspješno ste se odjavili.")
    return redirect('login')

#   >>> REGISTER / LOGIN / LOGOUT <<<


#   >>> PDF FUNCTIONS START <<<
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
    pisa_status = pisa.CreatePDF(html.encode('UTF-8'), dest=response, encoding='UTF-8')

    if pisa_status.err:
       return HttpResponse('We had some errors <pre>' + html + '</pre>')
    return response
#   >>> PDF FUNCTIONS END <<<

#   >>> RATE RECIPES <<<
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

        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    return JsonResponse({'success':'false'})

def filter_recipes(request):
    rezultat = request.GET.get('rezultat')
    print(rezultat)

    if rezultat == 'Doručak':
        qs = Recepti.objects.filter(vrsta_obroka__contains='Dorucak')
        p = Paginator(qs,6)
        page_number = request.GET.get('page')
        recipes = p.get_page(page_number)
        return render(request,"home/main.html",{"allr":recipes, "rezultat":rezultat})

    elif rezultat == 'Ručak':
        qs = Recepti.objects.filter(vrsta_obroka__contains='Rucak')
        p = Paginator(qs,6)
        page_number = request.GET.get('page')
        recipes = p.get_page(page_number)
        return render(request,"home/main.html",{"allr":recipes, "rezultat":rezultat})
    
    elif rezultat == 'Večera':
        qs = Recepti.objects.filter(vrsta_obroka__contains='Vecera')
        p = Paginator(qs,6)
        page_number = request.GET.get('page')
        recipes = p.get_page(page_number)
        return render(request,"home/main.html",{"allr":recipes, "rezultat":rezultat})
    
    elif rezultat == 'Poslastica':
        qs = Recepti.objects.filter(vrsta_obroka__contains='Poslastica')
        p = Paginator(qs,6)
        page_number = request.GET.get('page')
        recipes = p.get_page(page_number)
        return render(request,"home/main.html",{"allr":recipes, "rezultat":rezultat})

    elif rezultat == 'Užina':
        qs = Recepti.objects.filter(vrsta_obroka__contains='Uzina')
        p = Paginator(qs,6)
        page_number = request.GET.get('page')
        recipes = p.get_page(page_number)
        return render(request,"home/main.html",{"allr":recipes, "rezultat":rezultat})

    return render(request,"home/main.html",{})
