# Generated by Django 2.2.2 on 2019-07-02 10:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('group', '0004_auto_20190702_1526'),
    ]

    operations = [
        migrations.AlterField(
            model_name='group',
            name='gcode',
            field=models.CharField(max_length=10, primary_key=True, serialize=False, unique=True),
        ),
    ]
