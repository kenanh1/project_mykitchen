from django import forms
from .models import NacinPripreme, Recepti, Sastojci


class ReceptiForm(forms.ModelForm):
    class Meta:
        model = Recepti
        fields =(
            'naziv',
            'slika_jela',
            'datum_objave',
            'kalorije',
            'tezina_pripreme',
            'nacin_pripreme_id',
            'vrsta_jela_id',
            'vrsta_obroka_id',
        )

class NacinpripemeForm(forms.ModelForm):
    class Meta:
        model = NacinPripreme
        fields = (
            'vrijeme_pripreme',
            'ukupno_vrijeme_pripreme',
            'sastojak_id',
            'broj_osoba',
        )

class SastojciForm(forms.ModelForm):
    class Meta:
        model = Sastojci
        fields = (
            'ime_sastojka',
            'broj_kalorija_sastojka',
        )
