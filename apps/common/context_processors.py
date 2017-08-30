#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: common_info.py
@time: 2017/7/24 22:26
@describe: 全局处理器
"""
from django.db.models import Count

from notes.models import Notes, Category, Tag
from utils.mixin_utils import tag_font


def common_info(request):
    all_notes = Notes.objects.all()
    public_hot_notes = all_notes.filter(is_public=True).order_by('-click_nums')[:5]
    all_public_categorys = Category.objects.filter(notes__is_public=True).annotate(
            note_num=Count('notes')).filter(note_num__gt=0).order_by('-note_num')


    if request.user.is_authenticated():
        user_public_categorys = Category.objects.filter(notes__is_public=True, author=request.user).annotate(
                note_num=Count('notes')).filter(note_num__gt=0).order_by('-note_num')

        user_private_categorys = Category.objects.filter(notes__is_public=False, author=request.user).annotate(
                note_num=Count('notes')).filter(note_num__gt=0).order_by('-note_num')

        user_public_hot_notes = Notes.objects.filter(is_public=True, author=request.user).order_by('-click_nums')[:5]
        user_private_hot_notes = Notes.objects.filter(is_public=False, author=request.user).order_by('-click_nums')[:5]
    else:
        user_public_categorys = []
        user_private_categorys = []
        user_private_hot_notes = []
        user_public_hot_notes = []

    # 最新文章
    new_public_notes = all_notes.filter(is_public=True).order_by("-add_time")[:3]

    # 云标签
    tags = Tag.objects.annotate(note_num=Count('notes')).filter(note_num__gt=0)
    dict_tags = {tag.name: tag.note_num for tag in tags}

    return {
        "NEW_PUBLIC_NOTES": new_public_notes,
        "PUBLIC_HOT_NODES": public_hot_notes,
        "USER_PUBLIC_HOT_NODES": user_public_hot_notes,
        "USER_PRIVATE_HOT_NODES": user_private_hot_notes,
        "ALL_PUBLIC_CATEGORYS": all_public_categorys,
        "USER_PUBLIC_CATEGORYS": user_public_categorys,
        "USER_PRIVATE_CATEGORYS": user_private_categorys,
        "TAGS": tag_font(dict_tags),
    }
