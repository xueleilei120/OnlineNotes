#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: forms.py
@time: 2017/8/3 21:04
@describe:
"""
from django import forms
from captcha.fields import CaptchaField


from users.models import UserProfile


class LoginForm(forms.Form):
    # required=True 表示不能为空
    username = forms.CharField(required=True, error_messages={"required": u"邮箱或用户名不能为空!"})
    password = forms.CharField(required=True, min_length=3,
                               error_messages={"required": u"密码不能为空!", "min_length":u"密码不能少于三位！"})


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    nickname = forms.CharField(max_length=50, error_messages={"required": u"昵称不能为空!"})
    # 验证码
    captcha = CaptchaField(error_messages={"invalid": u"验证码错误!"})


class ModifyPwdForm(forms.Form):
    password1 = forms.CharField(required=True, min_length=5)
    password2 = forms.CharField(required=True, min_length=5)