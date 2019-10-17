# Generated by Django 2.2.2 on 2019-07-06 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='crequest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('status', models.CharField(default=0, max_length=1)),
                ('ccode', models.CharField(max_length=10)),
                ('tcode', models.CharField(max_length=10)),
            ],
            options={
                'unique_together': {('tcode', 'ccode')},
            },
        ),
    ]
