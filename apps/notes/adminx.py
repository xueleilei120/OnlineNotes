#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
@author: liuyc
@file: adminx.py
@time: 2017/1/6 22:12
@describe:
"""
import xadmin


from .models import Notes, NoPublicNotes, Category, Tag
from users.models import UserProfile


# 在笔记中增加一个用户管理器
class UserInline(object):
    model = UserProfile
    extra = 0

class NotesAdmin(object):
    # 后台中点击邮箱验证码 要显示的字段
    list_display = ['name', 'author', 'is_public', 'click_nums', 'add_time', 'go_to']
    # 后台要搜索的字段
    search_fields = ['name', 'author', 'content', 'is_public', 'click_nums', 'add_time']
    # 后台过滤器
    list_filter = ['name', 'author', 'content', 'is_public', 'click_nums', 'add_time']
    # 显示页直接编辑
    list_editable = ['is_public']
    # inlines = [UserInline]
    style_fields = {"content": "ueditor"}
    model_icon = 'fa fa-sticky-note'
    refresh_times = [3, 5]
    import_excel = True     # 自己做的插件可以导入excel


    def queryset(self):
        qs = super(NotesAdmin, self).queryset()
        qs = qs.filter(is_public=True)
        return qs


class NoPublicNotesAdmin(object):
    # 后台中点击邮箱验证码 要显示的字段
    list_display = ['name', 'author', 'is_public', 'click_nums', 'add_time']
    # 后台要搜索的字段
    search_fields = ['name', 'author', 'content', 'is_public', 'click_nums', 'add_time']
    # 后台过滤器
    list_filter = ['name', 'author', 'content', 'is_public', 'click_nums', 'add_time']
    # 显示页直接编辑
    list_editable = ['is_public']
    style_fields = {"content": "ueditor"}
    model_icon = 'fa fa-sticky-note'

    def queryset(self):
        qs = super(NoPublicNotesAdmin, self).queryset()
        qs = qs.filter(is_public=False)
        return qs


# 分类后台管理
class CategoryAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = ['name']

# 分类后台管理
class TagAdmin(object):
    list_display = ['name']
    search_fields = ['name']
    list_filter = ['name']


xadmin.site.register(Notes, NotesAdmin)
xadmin.site.register(NoPublicNotes, NoPublicNotesAdmin)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Tag, TagAdmin)