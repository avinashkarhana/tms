# Generated by Django 2.2.2 on 2019-07-06 07:12

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('clearance', '0002_auto_20190702_1554'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='clearance',
            name='dcode',
        ),
    ]
