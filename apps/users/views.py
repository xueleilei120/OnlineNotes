# _*_ encoding:utf-8 _*_
from django.shortcuts import render, HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
import json


from .models import UserProfile
from .forms import LoginForm, RegisterForm
# Create your views here.

# 用户后台登陆
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, email=None, password=None, **kwargs):
        try:
            # username 为空或者两个的时候都会报错，用Q可以实现并集验证
            user = UserProfile.objects.get(Q(username=username) | Q(email=email))
            # user = UserProfile.objects.get(username=username)
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# 首页
class IndexView(View):
    def get(self, request):
        return render(request, 'index.html', {})



class LogoutView(View):
    """
    用户登出
    """
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))

# 用类的形式登陆
class LoginView(View):
    def get(self, request):
         return render(request, "login.html", {})

    def post(self, request):
        # request.POST 这个参数是一个字典，回去做Form中的校验
        login_form = LoginForm(request.POST)
        # 表单验证
        if login_form.is_valid():
            email = request.POST.get("email", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(email=email, password=pass_word)
            if user is not None:
                login(request, user)
                return render(request, "index.html")
                # if user.is_active:
                #     login(request, user)
                #     return render(request, "index.html")
                # else:
                #     return render(request, "login.html", {"login_form": login_form, "msg": msg})
            else:
                return render(request, "login.html", {"login_form": login_form, "msg": "用户或者密码错误"})
        else:
            return render(request, "login.html", {"login_form": login_form})


# 用户邮箱注册
class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        # request.POST 这个参数是一个字典，回去做Form中的校验
        register_form = RegisterForm(request.POST)
        # 表单验证
        if register_form.is_valid():
            email = request.POST.get("email", "")
            nick_name = request.POST.get("nickname", "")
            if UserProfile.objects.filter(Q(email=email) | Q(nick_name=nick_name)):
                 return render(request, "register.html", {'register_form': register_form, "msg": "用户已经存在!"})
            pass_word = request.POST.get("password", "")
            print("user_name", email)
            user_profile = UserProfile()
            user_profile.username = nick_name
            user_profile.email = email
            user_profile.nick_name = nick_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word)
            user_profile.save()

            # send_register_email(email, 'register')
            return HttpResponseRedirect(reverse("login"))
        else:
            return render(request, "register.html", {'register_form': register_form})
