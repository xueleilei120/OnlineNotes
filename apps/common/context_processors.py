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
    hot_notes = Notes.objects.all().order_by('-click_nums')[:5]
    all_categorys = Category.objects.annotate(note_num=Count('notes')).filter(note_num__gt=0).order_by('note_num')

    return {
        "HOT_NODES": hot_notes,
        "ALL_CATEGORYS": all_categorys
    }
