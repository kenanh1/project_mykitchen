from django.contrib import admin
from . models import CijenaRecepta, Kontakt, Korisnici, ListaZelja, NacinPripreme, Pretplatnici, ReceptTest, Recepti, Sastojci, VideoRecepta, VrstaJela, VrstaObroka, ZdravaHrana

# Register your models here.

admin.site.register(Recepti)
admin.site.register(Korisnici)
admin.site.register(NacinPripreme)
admin.site.register(VrstaObroka)
admin.site.register(VrstaJela)
admin.site.register(ZdravaHrana)
admin.site.register(ListaZelja)
admin.site.register(VideoRecepta)
admin.site.register(Pretplatnici)
admin.site.register(Kontakt)
admin.site.register(Sastojci)
admin.site.register(CijenaRecepta)

#TESTNI RECEPT
admin.site.register(ReceptTest)