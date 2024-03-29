# Generated by Django 3.2.6 on 2021-09-17 21:29

import datetime
import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='attendence',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tcode', models.CharField(max_length=10)),
                ('date', models.DateField(default=datetime.date.today)),
                ('datetime', models.DateTimeField(auto_now=True)),
                ('status', models.IntegerField(validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
            ],
            options={
                'unique_together': {('tcode', 'date')},
            },
        ),
    ]
