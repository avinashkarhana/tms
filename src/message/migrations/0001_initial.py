# Generated by Django 2.2.2 on 2019-06-19 05:12

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='message',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tocode', models.CharField(max_length=10)),
                ('fromcode', models.CharField(max_length=10)),
                ('gstatus', models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0), django.core.validators.MaxValueValidator(1)])),
                ('msg', models.TextField()),
            ],
        ),
    ]
