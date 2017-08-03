#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: url.py
@time: 2017/1/14 11:13
@describe:
"""
from django.conf.urls import url, include


from notes.views import NotesView, NotesDetailView, NotesEditorView, NewEditorView, DeleteNoteView


urlpatterns = [
    # 笔记列表
    url(r'^list/$', NotesView.as_view(), name="note_list"),

    # 笔记详情
    url(r'^detail/(?P<note_id>\d+)/$', NotesDetailView.as_view(), name="note_detail"),

    # 编辑
    url(r'^editor/(?P<note_id>\d+)/$', NotesEditorView.as_view(), name="note_editor"),

    # 增加笔记
    url(r'^editor/$', NewEditorView.as_view(), name="new_editor"),

    # 删除笔记
    url(r'^delete/(?P<note_id>\d+)/$', DeleteNoteView.as_view(), name="note_delete"),

]
