# Generated by Django 3.0.8 on 2021-08-02 19:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='user',
            fields=[
                ('username', models.CharField(max_length=120, primary_key=True, serialize=False, unique=True)),
                ('password', models.CharField(max_length=120)),
                ('utype', models.CharField(max_length=10)),
                ('ucode', models.CharField(max_length=10)),
            ],
        ),
    ]
