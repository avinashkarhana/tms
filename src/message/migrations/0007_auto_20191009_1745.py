# Generated by Django 2.2.2 on 2019-10-09 12:15

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('message', '0006_message_datetime'),
    ]

    operations = [
        migrations.RenameField(
            model_name='message',
            old_name='datetime',
            new_name='dateandtime',
        ),
    ]
