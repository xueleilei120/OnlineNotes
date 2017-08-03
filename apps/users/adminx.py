# -*- coding: utf-8 -*-

import xadmin
from xadmin import views
from xadmin.plugins.auth import UserAdmin
from xadmin.layout import Fieldset, Main, Side, Row
from django.utils.translation import ugettext as _


from .models import UserProfile


class UserProfileAdmin(UserAdmin):
    model_icon = 'fa fa-address-book-o'
    def get_form_layout(self):
        if self.org_obj:
            self.form_layout = (
                Main(
                    Fieldset('',
                             'username', 'password',
                             css_class='unsort no_title'
                             ),
                    Fieldset(_('Personal info'),
                             Row('first_name', 'last_name'),
                             'email'
                             ),
                    Fieldset(_('Permissions'),
                             'groups', 'user_permissions'
                             ),
                    Fieldset(_('Important dates'),
                             'last_login', 'date_joined'
                             ),
                ),
                Side(
                    Fieldset(_('Status'),
                             'is_active', 'is_staff', 'is_superuser',
                             ),
                )
            )
        return super(UserAdmin, self).get_form_layout()


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True

class GlobalSettings(object):
    site_title = "个人在线笔记管理系统"
    site_footer = "个人在线笔记"
    menu_style = "accordion"


xadmin.site.unregister(UserProfile)
xadmin.site.register(UserProfile, UserProfileAdmin)


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSettings)