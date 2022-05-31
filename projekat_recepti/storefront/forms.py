from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Korisnik, Recepti, Sastojci, Komentari, ReceptiSteps
from django import forms
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
            raise forms.ValidationError("username is taken")
        return username

    def clean_email(self):
        email = self.cleaned_data.get('email')
        email_check = User.objects.filter(email=email)
        if email_check.exists():
            raise forms.ValidationError("email is taken")
        return email


class EditUserProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'first_name','last_name','email']

class EditUserPictureForm(forms.ModelForm):
    avatar = forms.ImageField(widget=forms.FileInput(attrs={'label':'Avatar'}))
    class Meta:
        model = Korisnik
        fields = ['avatar']


#FORM FOR ADDING NEW RECIPE
class ReceptiForm(forms.ModelForm):
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

class SastojciForm(forms.ModelForm):
    class Meta:
        model = Sastojci
        fields = (
            'ime_sastojka',
            'kolicina'
        )

SastojciFormset = formset_factory(SastojciForm, extra=0)

class ReceptiStepsForm(forms.ModelForm):
    class Meta:
        model = ReceptiSteps
        fields = ('body',)


class KomentariForm(forms.ModelForm):
    content = forms.CharField(widget=forms.Textarea(attrs={
        'rows':'4',
        'placeholder':'Dodajte Vas komentar...',
        }))

    class Meta:
        model = Komentari
        fields = ('content',)