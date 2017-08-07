#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: forms.py
@time: 2017/2/19 22:04
@describe:
"""
from django import forms

from notes.models import Notes, Category, Tag
from users.models import UserProfile


class NodeEditorForm(forms.ModelForm):
    def __init__(self, user, *args, **kwargs):
        super(NodeEditorForm, self).__init__(*args, **kwargs)  # populates the post
        if isinstance(user, UserProfile):
            self.fields['category'].queryset = Category.objects.filter(author=user)
            self.fields['tag'].queryset = Tag.objects.filter(author=user)

    class Meta:
        model = Notes
        # 要取出 NodeEditorForm 中的字段， 调用 model.save也可以保存到数据库
        fields = ('name', 'image', 'category', 'tag', 'is_public', 'content')
        labels = {
            'name': '标题',
            'image': '封面图',
            'category': '笔记类别(必选),如果没有则需添加类别!',
            'tag': '笔记标签(必选),如果没有则需添加标签!',
            'content': '笔记内容',
            'is_public': '是否公开',
        }


class CategoryForm(forms.ModelForm):
    class Meta:
        model = Category
        fields = ('name',)
        labels = {
            'name':'类别名'
        }


class TagForm(forms.ModelForm):
    class Meta:
        model = Tag
        fields = ('name',)
        labels = {
            'name':'标签名'
        }