#!/usr/bin/env python3

'''
-*- coding: utf-8 -*-
@Author  : LiZhichao
@Time    : 2019/9/26 19:09
@Software: PyCharm
@File    : urls.py
'''
from django.conf.urls import url
from django.contrib import admin
from .views import *

urlpatterns = [
    url('^register/',register_in,name='register'),
    url('^registerin/',register_,name='register_in'),
    url('^login/',login_in,name='login'),
    url('^loginin/',login_,name='login_in'),
    url('^loginout/',login_out,name='login_out'),
]