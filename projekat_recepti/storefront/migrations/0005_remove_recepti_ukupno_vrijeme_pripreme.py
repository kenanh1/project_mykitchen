# Generated by Django 4.0.3 on 2022-06-06 18:13

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('storefront', '0004_alter_receptisteps_body'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='recepti',
            name='ukupno_vrijeme_pripreme',
        ),
    ]
