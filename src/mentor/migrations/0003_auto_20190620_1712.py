# Generated by Django 2.2.2 on 2019-06-20 17:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mentor', '0002_auto_20190619_0502'),
    ]

    operations = [
        migrations.AlterField(
            model_name='mentor',
            name='dcode',
            field=models.CharField(default=0, max_length=10),
        ),
    ]
