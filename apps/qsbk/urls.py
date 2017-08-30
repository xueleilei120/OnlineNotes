#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: url.py
@time: 2017/1/14 11:13
@describe:
"""
from django.conf.urls import url, include
from views import QsbkArticlesView


urlpatterns = [
    # 笔记列表
    url(r'^list/$', QsbkArticlesView.as_view(), name="article_list"),
]
