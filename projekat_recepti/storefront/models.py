from django.db import models
from multiselectfield import MultiSelectField
from django.contrib.auth.models import User
from ckeditor.fields import RichTextField

class Korisnik(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    avatar = models.ImageField(default='default_avatar.png', upload_to='profile_avatar')

    def __str__(self):
        if self.user:
            return self.user.username
    class Meta:
        verbose_name_plural = "Korisnik"

# /// ----- RECEPT MAIN MODEL START ----- ///
class Recepti(models.Model):
    # CHOICES FOR RATING AND NUMBER OF PEOPLE
    RATING_JELA = (
        ("1", "1"),
        ("2", "2"),
        ("3", "3"),
        ("4", "4"),
        ("5", "5"),
    )
    BROJ_OSOBA = (
            ("1", "1"),
            ("2", "2"),
            ("3", "3"),
            ("4", "4"),
            ("4+", "4+")
        )
    ODABIR_OBROKA = (
        ('Dorucak', 'Dorucak'),
        ('Rucak', 'Rucak'),
        ('Vecera', 'Vecera'),
        ('Poslastica', 'Poslastica'),
        ('Uzina', 'Uzina'),
    )
    
    naziv = models.CharField(max_length=50)
    user = models.ForeignKey(
        Korisnik,
        blank = True,
        null = True,
        on_delete = models.CASCADE
    )
    vrsta_obroka = MultiSelectField(
        choices=ODABIR_OBROKA,
    )
    slika_jela = models.ImageField(upload_to='slike')
    ocjena_jela = models.CharField(
        max_length=20,
        choices=RATING_JELA,
        default=1
        )
    datum_objave = models.DateField(auto_now_add=True)
    tezina_pripreme = models.CharField(
        max_length=20,
        choices=RATING_JELA,
        default=1
        )
    vrijeme_pripreme = models.PositiveIntegerField()
    ukupno_vrijeme_pripreme = models.PositiveIntegerField()
    broj_osoba = models.CharField(
        max_length=20,
        choices=BROJ_OSOBA,
        default=1
    )
    opis_jela = models.TextField()
    
    def __str__(self):
        return self.naziv
    class Meta:
        verbose_name_plural = "Recepti"

# /// ----- RECEPTI MAIN MODEL END ----- ///

class ZdravaHrana(models.Model):
    ODABIR_ZDRAVE_HRANE = (
        ('DTL', 'Dijetalna'),
        ('GLF', 'Bez Glutena'),
        ('CAL', 'Niskokaloricna'),
        ('VEG', 'Veganska'),
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
        Korisnik,
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
        Korisnik,
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
    kolicina = models.CharField(max_length=150)
    
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


class Komentari(models.Model):
    recept = models.ForeignKey(Recepti, related_name="comments", on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    user = models.ForeignKey(Korisnik, on_delete=models.CASCADE)
    content = models.TextField()

    def __str__(self):
        return f"{self.user} - {self.recept.naziv}"


class ReceptiSteps(models.Model):
    recept = models.ForeignKey(Recepti,on_delete=models.CASCADE)
    body = RichTextField(blank=True, null=True)