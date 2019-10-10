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
    url('^addcart',add_cart,name='add_cart'),
    url('^cart',cart_info,name='cart'),
    url('^order',order,name='order'),
    url('^addorder',add_order,name='addorder'),
]