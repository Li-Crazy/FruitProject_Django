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
    url(r'^$', index, name="index"),
]