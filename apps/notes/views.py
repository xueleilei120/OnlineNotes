# -*- coding: utf-8 -*-
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.db.models import Q
from django.core.urlresolvers import reverse

from notes.models import Notes, Category, Tag
from notes.forms import NodeEditorForm, CategoryForm, TagForm
from utils.mixin_utils import LoginRequiredMixin
# from common.cache_manager import CacheMannager
# Create your views here.

# CHACHE_MANAGER = CacheMannager()


class NotesView(View):
    """
    笔记列表
    """
    def get(self, request):
        all_notes = Notes.objects.all().order_by("-add_time")
        # 搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_notes = all_notes.filter(Q(author__icontains=search_keywords) | Q(name__icontains=search_keywords) |
                                         Q(content__icontains=search_keywords))
        # 排序sort
        category_name = request.GET.get('category_name', '')

        # 用户是否登陆(公开与隐私过滤)
        if request.user.is_authenticated():
            all_notes = all_notes.filter(Q(author=request.user) | Q(is_public=True))
        else:
            all_notes = all_notes.filter(is_public=True)

        # 分类过滤
        if category_name != "":
            all_notes = all_notes.filter(category__name=category_name)

        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_notes, 3, request=request)

        notes = p.page(page)
        return render(request, 'note-list.html', {
            'all_notes': notes,
        })


class NotesDetailView(View):
    def get(self, request, note_id):
        note = get_object_or_404(Notes, id=int(note_id))
        # 增加点击数
        # CHACHE_MANAGER.update_click(note)
        note.click_nums += 1
        note.save()
        return render(request, 'node-detail.html', {
            'note': note,
        })


class NotesEditorView(View):
    """编辑笔记"""
    def get(self, request, note_id):
        # 用户是否登陆
        if not request.user.is_authenticated():
            return HttpResponseRedirect(reverse("login"))
        note = Notes.objects.get(id=int(note_id))
        form = NodeEditorForm(request.user, instance=note)
        return render(request, 'node_editor.html', {
            'form': form
        })

    def post(self, request, note_id):
        note = Notes.objects.get(id=int(note_id))
        note_form = NodeEditorForm(request.user, request.POST, request.FILES, instance=note)
        if note_form.is_valid():
            note = note_form.save(commit=False)
            note.save()
            return render(request, 'node-detail.html', {
                'note': note,
            })
        return render(request, 'node_editor.html', {
            'form': note_form,
        })


class NewEditorView(View):
    """
    增加新文章
    """
    def get(self, request):
        # 用户是否登陆
        if not request.user.is_authenticated():
             return HttpResponseRedirect(reverse("login"))
        form = NodeEditorForm(request.user)
        # form.Meta.
        return render(request, 'node_editor.html', {
            'form': form,
        })

    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponseRedirect(reverse("login"))
        note_form = NodeEditorForm(request.user, request.POST, request.FILES)
        if note_form.is_valid():
            note = note_form.save(commit=False)
            note.author = request.user
            note.save()
            return render(request, 'node-detail.html', {
                'note': note,
            })

        return render(request, 'node_editor.html', {
            'form': note_form,
        })


class SearchNotesView(View):
    """
    搜索
    """
    def get(self, request):
        form = NodeEditorForm(request.user)
        return render(request, 'node_editor.html', {
            'form': form,
        })

    def post(self, request):
        note_form = NodeEditorForm(request.user, request.POST, request.FILES)
        if note_form.is_valid():
            note = note_form.save(commit=False)
            note.author = request.user
            note.save()
            return render(request, 'node-detail.html', {
                'note': note,
            })

        return render(request, 'node_editor.html', {
            'form': note_form,
        })


class DeleteNoteView(View):
    """
    删除文章
    """
    def get(self, request, note_id):
        # 用户是否登陆
        if not request.user.is_authenticated():
            return HttpResponseRedirect(reverse("login"))
        note = get_object_or_404(Notes, id=int(note_id))
        note.delete()
        return redirect("/notes/list/")


class TagListView(LoginRequiredMixin, View):
    """
    标签列表
    """
    def get(self, request):
        tags = Tag.objects.filter(author=request.user)
        return render(request, 'tag-list.html', {
            'tags':tags,
        })


class AddTagView(LoginRequiredMixin, View):
    """
    添加标签
    """
    def get(self, request):
        form = TagForm()
        return render(request, 'tag_editor.html', {
            'form':form,
        })

    def post(self, request):
        tag_form = TagForm(request.POST)
        if tag_form.is_valid():
            tag = tag_form.save(commit=False)
            tag.author = request.user
            tag.save()
            return HttpResponseRedirect(reverse("notes:tag_list"))

        return render(request, 'tag_editor.html', {
            'form':tag_form,
        })

class EditorTagView(LoginRequiredMixin, View):
    """
    编辑标签
    """
    def get(self, request, tag_id):
        tag = get_object_or_404(Tag, id=int(tag_id))
        form = TagForm(instance=tag)
        return render(request, 'tag_editor.html', {
            'form':form,
        })

    def post(self, request, tag_id):
        tag = get_object_or_404(Tag, id=int(tag_id))
        tag_form = TagForm(request.POST, instance=tag)
        if tag_form.is_valid():
            tag_form.save()
            return HttpResponseRedirect(reverse("notes:tag_list"))

        return render(request, 'tag_editor.html', {
            'form':tag_form,
        })

class DeleteTagView(LoginRequiredMixin, View):
    """
    删除标签
    """
    def post(self, request, tag_id):
        tag = Tag.objects.filter(author=request.user, id=int(tag_id))
        if tag.exists():
            tag.delete()
            return HttpResponse('{"status":"success", "msg":"删除标签成功"}', content_type='application/json')
        return HttpResponse('{"status":"fail", "msg":"删除标签失败"}', content_type='application/json')


class CategoryListView(LoginRequiredMixin, View):
    """
    类别列表
    """
    def get(self, request):
        categorys = Category.objects.filter(author=request.user)
        return render(request, 'category-list.html', {
            'categorys':categorys,
        })


class AddCategoryView(LoginRequiredMixin, View):
    """
    添加类别
    """
    def get(self, request):
        form = CategoryForm()
        return render(request, 'category-editor.html', {
            'form':form,
        })

    def post(self, request):
        form = CategoryForm(request.POST)
        if form.is_valid():
            category = form.save(commit=False)
            category.author = request.user
            category.save()
            return HttpResponseRedirect(reverse("notes:category_list"))

        return render(request, 'category-list.html', {
            'form':form,
        })

class EditorCategoryView(LoginRequiredMixin, View):
    """
    编辑类别
    """
    def get(self, request, category_id):
        category = get_object_or_404(Category, id=int(category_id))
        form = CategoryForm(instance=category)
        return render(request, 'category-editor.html', {
            'form':form,
        })

    def post(self, request, category_id):
        category = get_object_or_404(Category, id=int(category_id))
        form = CategoryForm(request.POST, instance=category)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect(reverse("notes:category_list"))

        return render(request, 'category-editor.html', {
            'form':form,
        })

class DeleteCategoryView(LoginRequiredMixin, View):
    """
    删除类别
    """
    def post(self, request, category_id):
        category = Category.objects.filter(author=request.user, id=int(category_id))
        if category.exists():
            category.delete()
            return HttpResponse('{"status":"success", "msg":"删除类别成功"}', content_type='application/json')
        return HttpResponse('{"status":"fail", "msg":"删除类别失败"}', content_type='application/json')
