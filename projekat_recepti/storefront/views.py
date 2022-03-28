from django.shortcuts import render, get_object_or_404
from . models import Recepti
from .forms import NacinpripemeForm, ReceptiForm, SastojciForm

# Create your views here.
def home_view(request,):
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


def recept_detail(request):
    if request.method == "POST":
        form = ReceptiForm(request.POST)
        form2 = NacinpripemeForm(request.POST)
        form3 = SastojciForm(request.POST)
        if form.is_valid() and form2.is_valid() and form3.is_valid():
            name = form.cleaned_data['naziv']
            tezina = form.cleaned_data['tezina_pripreme']
        
    form = ReceptiForm()
    form2 = NacinpripemeForm()
    form3 = SastojciForm()
    return render(request,"form.html",{"form":form, "form2":form2, "form3":form3})