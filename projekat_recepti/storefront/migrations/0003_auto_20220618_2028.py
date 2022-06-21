# Generated by Django 3.2.13 on 2022-06-18 18:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('storefront', '0002_korisnik_favourites'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='korisnik',
            name='favourites',
        ),
        migrations.AddField(
            model_name='recepti',
            name='favourites',
            field=models.ManyToManyField(blank=True, related_name='favourites', to='storefront.Korisnik'),
        ),
    ]
