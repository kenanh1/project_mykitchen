from django.urls import path
from . import views

urlpatterns = [
    path ('home/',views.home_view, name='home'),
    path ('recipes/',views.recipes_view, name='recipes'),
    path ('jelo/<int:id>/',views.jelo_view, name='jelo'),
    path ('dodavanje/',views.recept_detail, name='dodavanje')
]