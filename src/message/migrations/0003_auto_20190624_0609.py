# Generated by Django 2.2.2 on 2019-06-24 06:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('message', '0002_auto_20190619_0552'),
    ]

    operations = [
        migrations.AddField(
            model_name='message',
            name='fromtype',
            field=models.CharField(default='X', max_length=1),
        ),
        migrations.AddField(
            model_name='message',
            name='totype',
            field=models.CharField(default='X', max_length=1),
        ),
    ]
