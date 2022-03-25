from django.shortcuts import render, get_object_or_404
from . models import ReceptTest, Recepti

# Create your views here.
def home_view(request,):
    prviRed = Recepti.objects.all()[0:3]
    drugiRed = Recepti.objects.all()[3:6]
    test_jelo = ReceptTest.objects.all()
    listaRecepata = Recepti.objects.all()
    return render (request,"home_main.html", {'prvi_red': prviRed, 'drugi_red': drugiRed, "allr": listaRecepata, "testjelo":test_jelo})

def recipes_view(request):
    recept = Recepti.objects.all()
    return render (request,"recipes_main.html",{'recept': recept})

def jelo_view(request,id):
    obj = Recepti.objects.get(id = id)
    svi_recepti = Recepti.objects.all()
    return render (request,"meal_template.html",{"object": obj, "svi_recepti":svi_recepti})
    # item = get_object_or_404(Recepti, id=id)
    # return render (request,"meal_template.html",{"item": item})
