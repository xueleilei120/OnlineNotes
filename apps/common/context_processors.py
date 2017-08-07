#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: common_info.py
@time: 2017/7/24 22:26
@describe: 全局处理器
"""
from django.db.models import Count

from notes.models import Notes, Category


def common_info(request):
    public_hot_notes = Notes.objects.filter(is_public=True).order_by('-click_nums')[:5]
    all_public_categorys = Category.objects.filter(notes__is_public=True).annotate(
            note_num=Count('notes')).filter(note_num__gt=0).order_by('note_num')

    if request.user.is_authenticated():
        user_public_categorys = Category.objects.filter(notes__is_public=True, author=request.user).annotate(
                note_num=Count('notes')).filter(note_num__gt=0).order_by('note_num')

        user_private_categorys = Category.objects.filter(notes__is_public=False, author=request.user).annotate(
                note_num=Count('notes')).filter(note_num__gt=0).order_by('note_num')

        user_public_hot_notes = Notes.objects.filter(is_public=True, author=request.user).order_by('-click_nums')[:5]
        user_private_hot_notes = Notes.objects.filter(is_public=False, author=request.user).order_by('-click_nums')[:5]
    else:
        user_public_categorys = []
        user_private_categorys = []
        user_private_hot_notes = []
        user_public_hot_notes = []

    return {
        "PUBLIC_HOT_NODES": public_hot_notes,
        "USER_PUBLIC_HOT_NODES": user_public_hot_notes,
        "USER_PRIVATE_HOT_NODES": user_private_hot_notes,
        "ALL_PUBLIC_CATEGORYS": all_public_categorys,
        "USER_PUBLIC_CATEGORYS": user_public_categorys,
        "USER_PRIVATE_CATEGORYS": user_private_categorys,
    }
