from django.urls import path
from . import views
from django.contrib.auth import views as auth_views


urlpatterns = [
    #CORE SITE
    path ('pocetna', views.home_view, name = 'home'),
    path ('recepti', views.recipes_view, name = 'recipes'),
    path ('kontakt', views.contact_view, name = 'contact'),
    path ('recept/<int:id>', views.jelo_view, name = 'jelo'),
    path ('profil', views.account_view, name = 'account'),
    path ('search', views.recipe_search_view, name='search-recipe'),
    path ('korisnik/<int:id>', views.users_view, name='user-acc'),

    #LOGIN REGISTER LOGOUT
    path ('registracija', views.register_view, name = 'register'),
    path ('login', views.login_view, name = 'login'),
    path ('logout', views.logout_view, name = 'logout'),
    #RECIPE RELATED
    path ('uredjivanje-recepta/<int:id>', views.update_recipes_view, name = 'update-jelo'),
    path ('uredjivanje-profila', views.edit_account_view, name='edit-acc'),
    path ('recept/<int:id>/pdf', views.render_pdf_view, name='recipe-pdf'),
    path ('rate/<int:id>', views.rate_recipes, name='rate-view'),
    path ('moji-recepti',views.my_recipes_view, name='myrecipes'),
    path ('spaseni-recepti',views.favourite_recipes_view, name='favouriterecipes'),
    
    #FAVOURITE RECIPE
    path ('favourites/<int:id>', views.add_favourite_view, name='add_favourite'),
    path ("addrecipe", views.adding_recipes_view, name='addrecipe'),

    #LIKE DISLIKE DELETE COMM
    path ("likes/<int:pk>", views.add_likes, name='comm-like'),
    path ("dislikes/<int:pk>", views.add_dislikes, name='comm-dislike'),
    path ("deletecomm/<int:pk>", views.delete_comment, name='comment-delete'),
    
    #CATEGORY AJAX
    path ('vrstajela/<slug:foo>', views.vrstajela_view, name='category-vrsta'),
    path ('tezinapripreme/<slug:foo>', views.tezinapripreme_view, name='category-tezina'),
    path ('serviranje/<slug:foo>', views.serviranje_view, name='category-serviranje'),
    path ('vrijemepripreme/<slug:foo>', views.vrijemepripreme_view, name='category-vrijeme'),

    #TERMS OF USE
    path ('uslovi-koristenja', views.terms_view, name='terms-of-use'),

]

