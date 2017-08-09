# -*- coding: utf-8 -*-
__author__ = 'bobby'

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