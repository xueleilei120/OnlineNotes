# -*- coding: utf-8 -*-

from django.contrib.auth.decorators import login_required
from django.utils.decorators import method_decorator
from django.contrib import messages


class LoginRequiredMixin(object):

    @method_decorator(login_required(login_url='/login/'))
    def dispatch(self, request, *args, **kwargs):
        return super(LoginRequiredMixin, self).dispatch(request, *args, **kwargs)


def message_user(request, message, level='info', extra_tags='bg-warning text-warning'):
    """
    Send a message to the user. The default implementation
    posts a message using the django.contrib.messages backend.
    """
    if hasattr(messages, level) and callable(getattr(messages, level)):
        getattr(messages, level)(request, message, extra_tags=extra_tags)

MIN_TAG = 8
MAX_TAG = 24

def tag_font(dict_tags):
    """
    云标签字体算法
    思路：最小字体为MIN_TAG,文章每增加一个增加2px，封顶为MAX_TAG
    :param dict_tags:  {name:num}
    """
    return [(name, num, MIN_TAG+(num-1)*2 if MIN_TAG+(num-1)*2<=MAX_TAG else MAX_TAG) for name, num in dict_tags.items()]
