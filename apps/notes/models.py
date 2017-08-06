# _*_ encoding=utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models
from DjangoUeditor.models import UEditorField
from users.models import UserProfile

# Create your models here.


class Tag(models.Model):
    author = models.ForeignKey(UserProfile, verbose_name=u"作者")
    name = models.CharField(max_length=40, default="", verbose_name=u"笔记标签")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'标签'
        verbose_name_plural = u'标签'


class Category(models.Model):
    author = models.ForeignKey(UserProfile, verbose_name=u"作者")
    name = models.CharField(max_length=40, default="", verbose_name=u"分类")

    def __unicode__(self):
        return self.name

    class Meta:
        verbose_name = u'分类'
        verbose_name_plural = u'分类'


class Notes(models.Model):
    author = models.ForeignKey(UserProfile, verbose_name=u"作者")
    name = models.CharField(max_length=200, verbose_name=u"标题")
    content = UEditorField(verbose_name=u'笔记内容', width=600, height=300,
                           imagePath="contents/ueditor/", filePath="contents/ueditor/", default='')
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏人数")
    image = models.ImageField(upload_to="notes/%Y/%m", verbose_name=u"封面图", default='images/default.jpg')
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    tag = models.ManyToManyField(Tag)
    category = models.ForeignKey(Category)
    is_public = models.BooleanField(default=True, verbose_name=u"是否公开")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe("<a href='http://www.baidu.com'>百度跳转</a>")
    go_to.short_description = "跳转"

    class Meta:
        verbose_name = u"笔记"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.name


class NoPublicNotes(Notes):
    class Meta:
        verbose_name = u"未公开的笔记"
        verbose_name_plural = verbose_name
        proxy = True    # 确定不再产生新的数据表

