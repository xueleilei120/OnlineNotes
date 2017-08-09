#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: url.py
@time: 2017/1/14 11:13
@describe:
"""
from django.conf.urls import url, include


from notes.views import NotesView, NotesDetailView, NotesEditorView, NewEditorView, DeleteNoteView, NoteManagerListView
from notes.views import TagListView, AddTagView, DeleteTagView, EditorTagView, PublicNoteListByTagView
from notes.views import CategoryListView, AddCategoryView, DeleteCategoryView, EditorCategoryView

urlpatterns = [
    # 笔记列表
    url(r'^list/$', NotesView.as_view(), name="note_list"),

    # 根据云标签获取所有公开笔列表
    url(r'^listbytag/(?P<tag_name>\w+)/$', PublicNoteListByTagView.as_view(), name="public_note_list_by_tag"),

    # 笔记详情
    url(r'^detail/(?P<note_id>\d+)/$', NotesDetailView.as_view(), name="note_detail"),

    # 编辑
    url(r'^editor/(?P<note_id>\d+)/$', NotesEditorView.as_view(), name="note_editor"),

    # 增加笔记
    url(r'^editor/$', NewEditorView.as_view(), name="new_editor"),

    # 删除笔记
    url(r'^delete/(?P<note_id>\d+)/$', DeleteNoteView.as_view(), name="note_delete"),

    # 标签列表
    url(r'^notemanager/$', NoteManagerListView.as_view(), name="note_manager_list"),

    #################### 标签 ##################
    # 标签列表
    url(r'^taglist/$', TagListView.as_view(), name="tag_list"),

    # 添加标签
    url(r'^addtag/$', AddTagView.as_view(), name="tag_add"),

    # 删除标签
    url(r'^deletetag/(?P<tag_id>\d+)/$', DeleteTagView.as_view(), name="tag_delete"),

    # 编辑标签
    url(r'^editortag/(?P<tag_id>\d+)/$', EditorTagView.as_view(), name="tag_editor"),

    #################### 类别 ##################

    # 类别列表
    url(r'^categorylist/$', CategoryListView.as_view(), name="category_list"),

    # 添加类别
    url(r'^addcategory/$', AddCategoryView.as_view(), name="category_add"),

    # 删除类别
    url(r'^deletecategory/(?P<category_id>\d+)/$', DeleteCategoryView.as_view(), name="category_delete"),

    # 编辑类别
    url(r'^editorcategory/(?P<category_id>\d+)/$', EditorCategoryView.as_view(), name="category_editor"),
]
