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
from .forms import LoginForm, RegisterForm, ModifyPwdForm
from utils.mixin_utils import LoginRequiredMixin
# Create your views here.

# 用户后台登陆
class CustomBackend(ModelBackend):
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            # username 为空或者两个的时候都会报错，用Q可以实现并集验证
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
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
            username = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=username, password=pass_word)
            if user is not None:
                login(request, user)
                return render(request, "index.html")
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


class ModifyPwdView(LoginRequiredMixin, View):
    """
    修改用户密码
    """
    def get(self, request):
        form = ModifyPwdForm()
        return render(request, "password_reset.html", {
            'form': form,
        })

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return render(request, "password_reset.html", {"msg":"密码不一致"})
            user = UserProfile.objects.get(email=request.user.email)
            user.password = make_password(pwd2)
            user.save()
            return HttpResponseRedirect(reverse('login'))
        else:
            return render(request, "password_reset.html", {"modify_form":modify_form})


def page_not_found(request):
    #全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response

def page_error(request):
    #全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response