from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Korisnik
from django.forms import ModelForm


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = [
            'username', 'email', 'password1', 'password2'
        ]

class KorisnikForm(ModelForm):
	class Meta:
		model = Korisnik
		fields = '__all__'
		exclude = ['user']