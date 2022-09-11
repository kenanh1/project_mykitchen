from sys import prefix
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import Korisnik, Recepti, Sastojci, Komentari, ReceptiSteps
from django import forms
from django.forms import formset_factory, BaseModelFormSet, BaseFormSet, inlineformset_factory, modelformset_factory
from tinymce.widgets import TinyMCE


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username', 'email', 'password1', 'password2']

    def clean_username(self):
        username = self.cleaned_data.get('username')
        username_check = User.objects.filter(username=username)
        if username_check.exists():
            raise forms.ValidationError("korisničko ime je zauzeto")
        return username

    def clean_email(self):
        email = self.cleaned_data.get('email')
        email_check = User.objects.filter(email=email)
        if email_check.exists():
            raise forms.ValidationError("email adresa je zauzeta")
        return email
    
    def clean_password2(self):
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')

        if password1 != password2:
            raise forms.ValidationError("lozinke se ne poklapaju")
        return password2


class EditUserProfileForm(forms.ModelForm):
    class Meta:
        model = User
        fields = ['username', 'first_name','last_name','email']

class EditUserPictureForm(forms.ModelForm):
    avatar = forms.ImageField(widget=forms.FileInput(attrs={'label':'Avatar'}))
    biografija = forms.CharField(widget=forms.Textarea(attrs={'rows': '5'}))
    class Meta:
        model = Korisnik
        fields = ('avatar', 'biografija',)


class ReceptiForm(forms.ModelForm):
    naziv = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'Unesite naziv Vašeg jela'}))
    opis_jela = forms.CharField(widget=forms.Textarea(attrs={'placeholder': 'Kratki opis Vašeg jela'}))
    class Meta:
        model = Recepti
        fields =(
            'naziv',
            'opis_jela',
            'vrsta_obroka',
            'tezina_pripreme',
            'vrijeme_pripreme',
            'broj_osoba',
            'slika_jela', 
        )


class SastojciForm(forms.ModelForm):
    ime_sastojka = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'ime sastojka'}))
    kolicina = forms.CharField(widget=forms.TextInput(attrs={'placeholder': 'količina'}))
    prefix = "sastojak"
    class Meta:
        model = Sastojci
        fields = ('ime_sastojka','kolicina')

SastojciFormSet = modelformset_factory(Sastojci, form=SastojciForm, fields =['ime_sastojka', 'kolicina'], extra=0, can_delete=True)
# class BaseSastojciFormSet(BaseFormSet):
#     def __init__(self, *args, **kwargs):
#         super(SastojciForm, self).__init__(*args, **kwargs)

# class BaseSastojciFormSet(BaseModelFormSet):
#     def __init__(self, *args, **kwargs):
#         super().__init__(*args, **kwargs)

# SastojciFormset = formset_factory(SastojciForm, extra=0, can_delete=True)
# SastojciFormset = formset_factory(SastojciForm, extra=0, can_delete=True)
# SastojciFormset = formset_factory(SastojciForm, formset=BaseSastojciFormSet, extra=0, can_delete=True)

class KomentariForm(forms.ModelForm):
    content = forms.CharField(widget=forms.Textarea(attrs={
        'rows':'4',
        'placeholder':'Dodajte Vaš komentar...',
        'resize': 'none',
        }))

    class Meta:
        model = Komentari
        fields = ('content',)



class TinyMCEWidget(TinyMCE):
    def use_required_attribute(self, *args):
        return False


class ReceptiStepsForm(forms.ModelForm):
    # body = forms.CharField(widget=forms.Textarea(attrs={'placeholder': 'Kratki opis Vašeg jela','class':'step-form-editor'}))
    class Meta:
        model = ReceptiSteps
        fields = ('body',)

# StepsFormset = formset_factory(ReceptiStepsForm, extra=0)
StepsFormSet = modelformset_factory(ReceptiSteps, form=ReceptiStepsForm, fields=['body'], extra=0, can_delete=True)
# SastojciFormSet = modelformset_factory(Sastojci, form=SastojciForm, fields =['ime_sastojka', 'kolicina'], extra=0, can_delete=True)

class updateSastojkeForm(forms.ModelForm):
    class Meta:
        model = Sastojci
        fields = ('ime_sastojka','kolicina')


class ContactForm(forms.Form):
	name = forms.CharField(max_length = 50)
	email = forms.EmailField(max_length = 150)
	message = forms.CharField(widget = forms.Textarea, max_length = 2000)