# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2017-08-04 20:36
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0002_auto_20170804_2032'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notes',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='notes.Category'),
        ),
        migrations.AlterField(
            model_name='notes',
            name='tag',
            field=models.ManyToManyField(to='notes.Tag'),
        ),
    ]
