# Generated by Django 2.2.2 on 2019-06-19 04:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='attendencne',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tcode', models.CharField(max_length=10)),
                ('date', models.DateTimeField()),
                ('status', models.IntegerField(max_length=1)),
            ],
        ),
    ]
