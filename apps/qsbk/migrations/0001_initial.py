# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2017-08-30 09:08
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='QiuShiArticle',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('author', models.CharField(default='\u533f\u540d', max_length=200, verbose_name='\u4f5c\u8005')),
                ('content', models.TextField(default='u\u65e0', verbose_name='')),
                ('image', models.ImageField(default='full/default.jpg', upload_to=b'', verbose_name='\u56fe\u7247')),
                ('crawl_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6293\u53d6\u65f6\u95f4')),
            ],
            options={
                'verbose_name': '\u7cd7\u4e8b\u767e\u79d1\u6587\u7ae0',
                'verbose_name_plural': '\u7cd7\u4e8b\u767e\u79d1\u6587\u7ae0',
            },
        ),
    ]