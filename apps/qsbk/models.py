# _*_ encoding=utf-8 _*_
from __future__ import unicode_literals
from datetime import datetime

from django.db import models

# Create your models here.


class QiuShiArticle(models.Model):
    author = models.CharField(verbose_name=u"作者", default=u"匿名", max_length=200)
    url = models.URLField(verbose_name=u"文章连接")
    content = models.TextField(verbose_name=u"", default="u无")
    image = models.ImageField(verbose_name=u"图片", default="full/default.jpg")
    crawl_time = models.DateTimeField(verbose_name=u"抓取时间", default=datetime.now)

    class Meta:
        verbose_name = u"糗事百科文章"
        verbose_name_plural = verbose_name

    def __unicode__(self):
        return self.author
