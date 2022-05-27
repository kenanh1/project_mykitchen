from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Korisnik, Recepti, Sastojci
from django.forms import ModelForm, ValidationError
from django.forms import formset_factory


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = [
            'username', 'email', 'password1', 'password2'
        ]

    def clean_username(self):
        username = self.cleaned_data.get('username')
        username_check = User.objects.filter(username=username)
        if username_check.exists():
            raise ValidationError("username is taken")
        return username

    def clean_email(self):
        email = self.cleaned_data.get('email')
        email_check = User.objects.filter(email=email)
        if email_check.exists():
            raise ValidationError("email is taken")
        return email


class EditUserProfileForm(ModelForm):
    class Meta:
        model = User
        fields = ['username', 'first_name','last_name','email']

class EditUserPictureForm(ModelForm):
    class Meta:
        model = Korisnik
        fields = ['avatar']


#FORM FOR ADDING NEW RECIPE
class ReceptiForm(ModelForm):
    class Meta:
        model = Recepti
        fields =(
            'naziv',
            'vrsta_obroka',
            'slika_jela',
            'tezina_pripreme',
            'vrijeme_pripreme',
            'ukupno_vrijeme_pripreme',
            'broj_osoba',
            'opis_jela'
        )

class SastojciForm(ModelForm):
    class Meta:
        model = Sastojci
        fields = (
            'ime_sastojka',
            'kolicina'
        )

SastojciFormset = formset_factory(SastojciForm, extra=0)
