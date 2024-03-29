import random

from django.shortcuts import render,get_object_or_404
from .models import *
from django.db import DatabaseError
import logging

# Create your views here.
def index(request):
    #方案一
    # 查询数据库全部分类全部商品
    # 按照分类名查询商品，并分别存储传回前端

    # 查询商品按照固定分类名
    try:
        good_fruit_type = get_object_or_404(GoodType,title='水果')
        fruit_goods = random.sample(list(good_fruit_type.goods_set.all()),2)
    except DatabaseError as e:
        logging.warning(e)
    # 返回首页


    # 查询全部商品
    # 查询全部分类
    types = GoodType.objects.all()
    goods = Goods.objects.all()


    # 查询分类
    # 该类下全部商品
    ac = []
    typess = GoodType.objects.all()
    for type in typess:
        b = {}
        b['type'] = type.title
        good_type = get_object_or_404(GoodType, title=type.title)
        f_goods = random.sample(list(good_type.goods_set.all()), 2)
        b['goods'] = f_goods
        ac.append(b)

    return render(request,'index.html',{'good_list':locals()})

def detail_one(request):
    # 查询数据库该id的商品
    good_id = request.GET.get('goodid')[:-1]
    try:
        goodone = Goods.objects.filter(id=good_id)
    except DatabaseError as e:
        logging.warning(e)
    return render(request,'detail.html',{'goodone':goodone[0]})