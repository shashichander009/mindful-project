# Generated by Django 2.2 on 2020-09-17 10:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mindful_api', '0002_auto_20200915_1635'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='security_ans',
            field=models.TextField(max_length=256, null=True),
        ),
        migrations.AddField(
            model_name='user',
            name='security_que',
            field=models.TextField(max_length=256, null=True),
        ),
    ]