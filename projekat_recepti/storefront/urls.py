from django.urls import path
from . import views

urlpatterns = [
    #CORE SITE
    path ('pocetna/', views.home_view, name = 'home'),
    path ('recepti/', views.recipes_view, name = 'recipes'),

    path ('jelo/<int:id>/', views.jelo_view, name = 'jelo'),
    path ('login/', views.login_view, name = 'login'),
    path ('logout/', views.logout_view, name = 'logout'),
    path ('register/', views.register_view, name = 'register'),
    path ('account/', views.account_view, name = 'account'),
    path ('account/edit/', views.edit_account_view, name='edit-acc'),
    path ('myrecipes/',views.my_recipes_view, name='myrecipes'),
    path ('favourite-recipes/',views.favourite_recipes_view, name='favouriterecipes'),
    #FAVOURITE RECEPT URL
    path ('favourites/<int:id>/', views.add_favourite_view, name='add_favourite'),
    path ("addrecipe/", views.adding_recipes_view, name='addrecipe'),
    path ("likes/<int:pk>", views.add_likes, name='comm-like'),
    path ("dislikes/<int:pk>", views.add_dislikes, name='comm-dislike'),
    path ("deletecomm/<int:pk>", views.delete_comment, name='comment-delete'),
    path ('update/jelo/<int:id>/', views.update_recipes_view, name = 'update-jelo'),
    path ('korisnik/<int:id>/', views.users_view, name='user-acc'),
    path ('search/', views.recipe_search_view, name='search-recipe'),
    path ('jelo/<int:id>/pdf', views.render_pdf_view, name='recipe-pdf'),
    path('rate/<int:id>', views.rate_recipes, name='rate-view'),
]

