from django.db import models
from multiselectfield import MultiSelectField
from django.contrib.auth.models import User
from tinymce.models import HTMLField
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db.models import Avg

class Korisnik(models.Model):
    user = models.OneToOneField(User, null=True, blank=True, on_delete=models.CASCADE)
    avatar = models.ImageField(upload_to='profile_avatar', default='profile_avatar/default_avatar.jpg')
    favourites = models.ManyToManyField('Recepti', default=None, related_name="favourites", blank=True)
    biografija = models.TextField()

    def __str__(self):
        if self.user:
            return self.user.username
    class Meta:
        verbose_name_plural = "Korisnik"

    def total_recipes(self):
        counter = Recepti.objects.filter(user=self).count()
        return counter

    def avg_rating(self):
        recipes = Recepti.objects.filter(user=self)
        total = 0
        rated = 0
        for i in recipes:
            ratings = RatingRecepta.objects.all().filter(recept=i).aggregate(rating_avg=Avg('rating'))
            if ratings['rating_avg'] != None:
                rated +=1
                total += ratings['rating_avg']
        if rated != 0:
            result = total/rated
        else:
            result = 0
        return (result)
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
    
    TEZINA_PRIPREME = (
        ("Jednostavno", "Jednostavno"),
        ("Srednje", "Srednje"),
        ("Komplikovano", "Komplikovano"),
    )

    ODABIR_OBROKA = (
        ('Dorucak', 'Dorucak'),
        ('Rucak', 'Rucak'),
        ('Vecera', 'Vecera'),
        ('Poslastica', 'Poslastica'),
        ('Uzina', 'Uzina'),
    )
    
    naziv = models.CharField(max_length=50)
    user = models.ForeignKey(Korisnik, blank = True, null = True, on_delete = models.CASCADE)
    vrsta_obroka = MultiSelectField(choices=ODABIR_OBROKA,)
    slika_jela = models.ImageField(upload_to='slike')
    datum_objave = models.DateField(auto_now_add=True)
    tezina_pripreme = models.CharField(max_length=20,choices=TEZINA_PRIPREME,default=1)
    vrijeme_pripreme = models.PositiveIntegerField()
    broj_osoba = models.CharField(max_length=20,choices=BROJ_OSOBA,default=1)
    opis_jela = models.TextField()
    
    def __str__(self):
        return self.naziv
    class Meta:
        verbose_name_plural = "Recepti"

    def avg_rating(self):
        ratings = RatingRecepta.objects.filter(recept=self).aggregate(rating_avg=Avg('rating'))
        if ratings['rating_avg'] == None:
            norating = ratings['rating_avg'] = 0
            return(norating)
        else:
            return round(ratings['rating_avg'],1)
    
    def total_votes(self):
        voting = RatingRecepta.objects.filter(recept=self).count()
        return voting


# /// ----- RECEPTI MAIN MODEL END ----- ///

class ZdravaHrana(models.Model):
    ODABIR_ZDRAVE_HRANE = (
        ('DTL', 'Dijetalna'),
        ('GLF', 'Bez Glutena'),
        ('CAL', 'Niskokaloricna'),
        ('VEG', 'Veganska'),
    )
    recepti_id = models.ForeignKey(Recepti,blank = True,null=True,on_delete=models.CASCADE)
    vrsta_hrane = models.CharField(max_length=3, choices=ODABIR_ZDRAVE_HRANE, default="Dijetalna",)
    class Meta:
        verbose_name_plural = "Zdrava hrana"

class RecipeVideos(models.Model):
    autor = models.CharField(max_length=20)
    title = models.CharField(max_length=50)
    video_src = models.CharField(max_length=20)
    video = models.FileField(upload_to='videozapisi')
    poster = models.ImageField(upload_to='video_poster', null=True, blank=True)
    def __str__(self):
        return f"{self.title}  by : {self.autor}"
    class Meta:
        verbose_name_plural = "Videos"


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
    recept_id = models.ForeignKey(Recepti,blank = True,null=True,on_delete=models.CASCADE)
    ime_sastojka = models.CharField(max_length=50)
    kolicina = models.CharField(max_length=150)
    
    def __str__(self):
        return self.ime_sastojka
    class Meta:
        verbose_name_plural = "Sastojci"
    

class Komentari(models.Model):
    recept = models.ForeignKey(Recepti, related_name="comments", on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    user = models.ForeignKey(Korisnik, on_delete=models.CASCADE)
    content = models.TextField()
    likes = models.ManyToManyField(Korisnik, blank=True, related_name='likes')
    dislikes = models.ManyToManyField(Korisnik, blank=True, related_name='dislikes')
    parent = models.ForeignKey("self", null=True, blank=True, on_delete=models.CASCADE, related_name='replies')

    def __str__(self):
        return f"{self.user}  komentarise : {self.recept.naziv}"

    def total_likes(self):
        return self.likes.count()

    def total_dislikes(self):
        return self.dislikes.count()

    def children(self):
        return Komentari.objects.filter(parent=self)

    @property
    def is_parent(self):
        if self.parent is not None:
            return False
        return True

class ReceptiSteps(models.Model):
    recept = models.ForeignKey(Recepti, on_delete=models.CASCADE)
    body = HTMLField(null=True, blank=True)

    def __str__(self):
        return f"Koraci pripreme - {self.recept.naziv}"

class RatingRecepta(models.Model):
    recept = models.ForeignKey(Recepti, related_name="rating_recepta", on_delete=models.CASCADE)
    user = models.ForeignKey(Korisnik, null=True, related_name='korisnik_rating', on_delete=models.CASCADE)
    rating = models.IntegerField(default=0, validators=[MaxValueValidator(5), MinValueValidator(0)])


    def __str__(self):
        return f"Rating: {self.recept.naziv}- {self.user.user}"