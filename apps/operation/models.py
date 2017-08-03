# _*_ encoding:utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

from users.models import UserProfile
from notes.models import Notes, Tag, Category

# Create your models here.


class UserNotes(models.Model):
    """
    用户笔记
    """
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    note = models.ForeignKey(Notes, verbose_name=u"笔记")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")



class UserTags(models.Model):
    """
    用户标签
    """
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    tag = models.ForeignKey(Tag, verbose_name=u"标签")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")



class UserCategorys(models.Model):
    """
    用户分类
    """
    user = models.ForeignKey(UserProfile, verbose_name=u"用户")
    category = models.ForeignKey(Category, verbose_name=u"分类")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")
