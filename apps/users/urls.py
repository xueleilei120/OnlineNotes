#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: urls.py
@time: 2017/8/3 21:01
@describe:
"""


from django.conf.urls import url


from users.views import ModifyPwdView


urlpatterns = [
    url(r'^modify_pwd/$', ModifyPwdView.as_view(), name='modify_pwd'),
]
