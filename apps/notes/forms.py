#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: forms.py
@time: 2017/2/19 22:04
@describe:
"""
from django import forms

from notes.models import Notes


class NodeEditorForm(forms.ModelForm):
    class Meta:
        model = Notes
        # 要取出 NodeEditorForm 中的字段， 调用 model.save也可以保存到数据库
        fields = ('name', 'image', 'category', 'tag', 'is_public', 'content')
        labels = {
            'name': '标题',
            'image': '封面图',
            'category': '笔记类别(必选)',
            'tag': '笔记标签(必选)',
            'content': '笔记内容',
            'is_public': '是否公开',
        }
