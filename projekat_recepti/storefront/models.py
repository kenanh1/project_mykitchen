from email.policy import default
from tkinter import CASCADE
from django.db import models

# Create your models here.

class Korisnici(models.Model):
    ime     = models.CharField(max_length=15)
    prezime = models.CharField(max_length=15)
    email   = models.EmailField(max_length=40)
    pretplatnik = models.BooleanField(default=False)
    sifra = models.CharField(max_length=20)
    slika_korisnika = models.ImageField(upload_to='slike')
    broj_pretplatnika = models.IntegerField()

    def __str__(self):
        return self.ime + ' ' + self.prezime
    class Meta:
        verbose_name_plural = "Korisnici"

class Recepti(models.Model):
    RATING_JELA = (
        ("1", "1"),
        ("2", "2"),
        ("3", "3"),
        ("4", "4"),
        ("5", "5"),
    )
    naziv = models.CharField(max_length=50)
    vrsta_obroka_id = models.ForeignKey(
        'VrstaObroka',
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    vrsta_jela_id = models.ForeignKey(
        'VrstaJela',
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    korisnik_id = models.ForeignKey(
        Korisnici,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    nacin_pripreme_id = models.ForeignKey(
        'NacinPripreme',
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    slika_jela = models.ImageField(upload_to='slike')
    ocjena_jela = models.CharField(
        max_length=20,
        choices=RATING_JELA,
        default=1
        )
    datum_objave = models.DateField()
    kalorije = models.IntegerField()
    tezina_pripreme = models.CharField(
        max_length=20,
        choices=RATING_JELA,
        default=1
        )
    
    def __str__(self):
        return self.naziv
    class Meta:
        verbose_name_plural = "Recepti"

class NacinPripreme(models.Model):
    BROJ_OSOBA = (
            ("1", "1"),
            ("2", "2"),
            ("3", "3"),
            ("4", "4"),
            ("4+", "4+")
        )
    recepti_id =  models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    sastojak_id = models.ManyToManyField(
        'Sastojci',
        blank = True
        # on_delete=models.CASCADE
    )
    vrijeme_pripreme = models.IntegerField()
    ukupno_vrijeme_pripreme = models.IntegerField()
    broj_osoba = models.CharField(
        max_length=20,
        choices=BROJ_OSOBA,
        default=1
    )
    opis_jela = models.TextField()
    def __str__(self):
        return f"Način pripreme za : {self.recepti_id}"
    class Meta:
        verbose_name_plural = "Način pripreme"

class VrstaObroka(models.Model):
    ODABIR_OBROKA = (
        ('Dorucak', 'Dorucak'),
        ('Rucak', 'Rucak'),
        ('Vecera', 'Vecera'),
        ('Poslastica', 'Poslastica'),
    )
    vrsta_obroka = models.CharField(
        max_length=10,
        choices=ODABIR_OBROKA,
        default="Dorucak",
    )

    def __str__(self):
        return self.vrsta_obroka
    class Meta:
        verbose_name_plural = "Vrsta obroka"
    
class VrstaJela(models.Model):
    ODABIR_VRSTE = (
        ('Sendvic', 'Sendvic'),
        ('Pita', 'Pita'),
        ('Pasta', 'Pasta'),
        ('Kolac', 'Kolac'),
        ('Peciva', 'Peciva'),
    )
    vrsta_jela = models.CharField(
        max_length=10,
        choices=ODABIR_VRSTE,
        default="Sendvic",
    )
    def __str__(self):
        print(self.vrsta_jela)
        return self.vrsta_jela
    class Meta:
        verbose_name_plural = "Vrsta jela"

class ZdravaHrana(models.Model):
    ODABIR_ZDRAVE_HRANE = (
        ('DTL', 'Dijetalna'),
        ('GLF', 'Bez Glutena'),
        ('CAL', 'Niskokaloricna'),
        ('VEG', 'Veganska'),
    )
    vrsta_jela_id = models.ForeignKey(
        VrstaJela,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    vrsta_obroka_id = models.ForeignKey(
        VrstaObroka,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    recepti_id = models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    vrsta_hrane = models.CharField(
        max_length=3,
        choices=ODABIR_ZDRAVE_HRANE,
        default="Dijetalna",
    )
    class Meta:
        verbose_name_plural = "Zdrava hrana"


class ListaZelja(models.Model):
    user_id = models.ForeignKey(
        Korisnici,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    recept_id = models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    class Meta:
        verbose_name_plural = "Lista želja"

class VideoRecepta(models.Model):
    naziv_videa = models.CharField(max_length=120)
    recept_id = models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    korisnik_id = models.ForeignKey(
        Korisnici,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    videolink = models.URLField()
    def __str__(self):
        return self.naziv_videa
    class Meta:
        verbose_name_plural = "Video recepta"

class Pretplatnici(models.Model):
    email = models.EmailField()
    class Meta:
        verbose_name_plural = "Pretplatnici"

class Kontakt(models.Model):
    email = models.EmailField()
    text_poruke = models.TextField()
    class Meta:
        verbose_name_plural = "Kontakt"

class Sastojci(models.Model):
    recept_id = models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    ime_sastojka = models.CharField(max_length=50)
    broj_kalorija_sastojka = models.IntegerField()

    def __str__(self):
        return self.ime_sastojka
    class Meta:
        verbose_name_plural = "Sastojci"
    

class CijenaRecepta(models.Model):
    recept_id =  models.ForeignKey(
        Recepti,
        blank = True,
        null=True,
        on_delete=models.CASCADE
    )
    class Meta:
        verbose_name_plural = "Cijena recepta"
