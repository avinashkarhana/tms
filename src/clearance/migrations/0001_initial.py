# Generated by Django 3.0.8 on 2021-08-02 19:07

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='clearance',
            fields=[
                ('cname', models.CharField(max_length=120)),
                ('ccode', models.AutoField(max_length=10, primary_key=True, serialize=False, unique=True)),
                ('mcode', models.CharField(max_length=10)),
            ],
        ),
    ]
