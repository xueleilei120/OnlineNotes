# -*- coding: utf-8 -*-
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse, HttpResponseRedirect
from django.db.models import Q
from django.core.urlresolvers import reverse

from notes.models import Notes, Category, Tag
from notes.forms import NodeEditorForm, CategoryForm, TagForm
from utils.mixin_utils import LoginRequiredMixin, message_user

# from common.cache_manager import CacheMannager
# Create your views here.

# CHACHE_MANAGER = CacheMannager()


class NotesView(View):
    """
    所有公开笔记列表
    """
    def get(self, request):
        # 公开或是隐私
        notes_type = request.GET.get('notes_type', '')

        # 当用户点击隐私笔记时，弹出登录
        if notes_type and not request.user.is_authenticated():
            return HttpResponseRedirect(reverse("login"))

        all_notes = Notes.objects.all().order_by("-add_time")
        # 搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_notes = all_notes.filter(Q(name__icontains=search_keywords) | Q(content__icontains=search_keywords))

        if request.user.is_authenticated():
            if notes_type == 'user_private':
                all_notes = all_notes.filter(author=request.user, is_public=False)
            elif notes_type == 'user_public':
                all_notes = all_notes.filter(author=request.user, is_public=True)
        else:
            all_notes = all_notes.filter(is_public=True)

        # 根据类别名筛选
        category_name = request.GET.get('category_name', '')
        if category_name:
            all_notes = all_notes.filter(category__name=category_name)

        # 根据标签筛选
        tag_name = request.GET.get('tag_name', '')
        if tag_name:
            all_notes = all_notes.filter(tag__name=tag_name)

        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_notes, 3, request=request)

        notes = p.page(page)
        return render(request, 'note-list.html', {
            'all_notes': notes,
            'notes_type': notes_type,
        })


class PublicNoteListByTagView(View):
    """
    根据云标签获取所有公开文章
    """
    def get(self, request, tag_name):
        all_notes = Notes.objects.all()
        lst = [node.tag.name for node in all_notes]

        notes = all_notes.filter(tag__name=tag_name)
        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(notes, 3, request=request)

        notes = p.page(page)

        # 默认为公开笔记
        notes_type = ''
        return render(request, 'note-list.html', {
            'all_notes': notes,
            'notes_type': notes_type,
        })


class NotesDetailView(View):
    def get(self, request, note_id):
        note = get_object_or_404(Notes, id=int(note_id))
        # 增加点击数
        # CHACHE_MANAGER.update_click(note)
        note.click_nums += 1
        note.save()
        can_editor = False
        if note.author == request.user:
            can_editor = True
        return render(request, 'note-detail.html', {
            'note': note,
            'can_editor': can_editor
        })


class NotesEditorView(LoginRequiredMixin, View):
    """编辑笔记"""
    def get(self, request, note_id):
        note = get_object_or_404(Notes, id=int(note_id), author=request.user)
        form = NodeEditorForm(request.user, instance=note)
        return render(request, 'note_editor.html', {
            'form': form
        })

    def post(self, request, note_id):
        note = Notes.objects.get(id=int(note_id))
        note_form = NodeEditorForm(request.user, request.POST, request.FILES, instance=note)
        if note_form.is_valid():
            note = note_form.save(commit=False)
            # 开始处理标签
            tags = note_form.cleaned_data.get('tag')
            all_tags = []
            if tags:
                for tag in tags:
                    try:
                        t = Tag.objects.get(name=tag)
                    except Tag.DoesNotExist as e:
                        raise e
                    all_tags.append(t)

            note.save()
            note.tag.clear()
            # 笔记标签更新
            for tg in all_tags:
                note.tag.add(tg)

            return HttpResponseRedirect(reverse('notes:note_list'))
        return render(request, 'note_editor.html', {
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
        return render(request, 'note_editor.html', {
            'form': form,
        })

    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponseRedirect(reverse("login"))
        note_form = NodeEditorForm(request.user, request.POST, request.FILES)
        if note_form.is_valid():
            note = note_form.save(commit=False)
            note.author = request.user
            # 开始处理标签
            tags = note_form.cleaned_data.get('tag')
            all_tags = []
            if tags:
                for tag in tags:
                    try:
                        t = Tag.objects.get(name=tag, author=request.user)
                    except Tag.DoesNotExist as e:
                        raise e
                    all_tags.append(t)

            note.save()
            note.tag.clear()
            # 笔记标签更新
            for tg in all_tags:
                note.tag.add(tg)

            title = note.name
            message_user(self.request,"增加文章(%s)成功"%(title) , 'success')
            return HttpResponseRedirect(reverse('notes:note_list'))

        return render(request, 'note_editor.html', {
            'form': note_form,
        })

class DeleteNoteView(LoginRequiredMixin, View):
    """
    删除文章
    """
    def get(self, request, note_id):
        note = Notes.objects.filter(author=request.user, id=int(note_id))
        if note.exists():
            title = note[0].name
            message_user(self.request,"删除文章(%s)成功"%(title) , 'success')
            note.delete()
            return HttpResponseRedirect(reverse("notes:note_list"))

        message_user(self.request,"文章不存在,删除文章失败", 'error')
        return HttpResponseRedirect(reverse("notes:note_list"))


class NoteManagerListView(LoginRequiredMixin, View):
    """
    标签列表
    """
    def get(self, request):
        notes = Notes.objects.filter(author=request.user)
        return render(request, 'note-manager-list.html', {
            'notes': notes,
        })


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
        msg = ''
        if tag_form.is_valid():
            tag = tag_form.save(commit=False)
            tag.author = request.user
            lst_tag = Tag.objects.filter(name=tag.name,author=tag.author)
            if lst_tag.exists():
                msg = "{0}:添加失败,该标签已经存在！".format(tag.name)
            else:
                tag.save()
                return HttpResponseRedirect(reverse("notes:tag_list"))

        return render(request, 'tag_editor.html', {
            'form': tag_form,
            'msg': msg,
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
        tag_original = get_object_or_404(Tag, id=int(tag_id))
        tag_form = TagForm(request.POST, instance=tag_original)
        msg = ''
        if tag_form.is_valid():
            tag = tag_form.save(commit=False)
            lst_tag = Tag.objects.filter(name=tag.name, author=tag.author)

            if not lst_tag.exists():
                tag.save()
                return HttpResponseRedirect(reverse("notes:tag_list"))
            else:
                msg = "{0}:修改失败,该标签已经存在！".format(tag.name)

        return render(request, 'tag_editor.html', {
            'form':tag_form,
            'msg': msg
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
        msg = ''
        if form.is_valid():
            category = form.save(commit=False)
            category.author = request.user
            categorys = Category.objects.filter(name=category.name, author=category.author)
            if not categorys.exists():
                category.save()
                return HttpResponseRedirect(reverse("notes:category_list"))
            else:
                msg = "{0}:添加失败,该分类已经存在！".format(category.name)

        return render(request, 'category-editor.html', {
            'form':form,
            'msg': msg
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
        category_original = get_object_or_404(Category, id=int(category_id))
        form = CategoryForm(request.POST, instance=category_original)

        category = form.save(commit=False)
        categorys = Category.objects.filter(name=category.name, author=category.author)
        msg = ''
        if form.is_valid():
            if not categorys.exists():
                category.save()
                return HttpResponseRedirect(reverse("notes:category_list"))
            else:
                msg = "{0}:修改失败，该分类已经存在！".format(category.name)

        return render(request, 'category-editor.html', {
            'form': form,
            'msg': msg,
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
