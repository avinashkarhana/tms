# Generated by Django 2.2.2 on 2019-06-19 06:26

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
