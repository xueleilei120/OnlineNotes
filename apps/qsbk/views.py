# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.

from models import QiuShiArticle


class QsbkArticlesView(View):

    def get(self, request):
        all_articles = QiuShiArticle.objects.all()
        # 对课程进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_articles, 10, request=request)

        all_articles = p.page(page)

        return render(request, "qsbk_articles.html", {
            "all_articles": all_articles
        })