# Generated by Django 4.0.3 on 2022-05-27 09:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('storefront', '0003_remove_recepti_vrsta_jela_id_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='sastojci',
            name='broj_kalorija_sastojka',
        ),
    ]
