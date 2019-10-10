import datetime
from django.shortcuts import render

# Create your views here.
import memberapp
import userinfo
from .models import *
import logging
from django.db import DatabaseError
import json
from django.http import HttpResponse

def add_cart(request):
    # 获取前端数据，商品id，商品数量
    # 获取用户ID
    # 查询
    # 存
    # 返回

    # 声明一个新的购物车
    new_cart = CartInfo()
    # 获取前端数据，商品id，商品数量
    good_id = request.GET.get('goodid')
    good_count = request.GET.get('gcount')
    # 获取用户ID
    user_id = request.session.get('user_id')
    good_ = memberapp.models.Goods.objects.filter(id=good_id)
    user_= userinfo.models.UserInfo.objects.get(id=user_id)
    # 查询用户
    # 查询商品
    # 判断商品是否存在
    if len(good_) > 0:
    # 查询购物车中该用户是否有此商品
        new_cart.user = user_
        new_cart.good = good_[0]
    else:
        content = {'static':'OK','text':'无该商品'}
        return HttpResponse(json.dumps(content))
        # return render(request,'index.html')
    new_cart.ccount = int(good_count)
    try:
        oldgood = CartInfo.objects.filter(user_id=user_id,good_id=good_id)
        if len(oldgood) > 0:
            oldgood[0].ccount = oldgood[0].ccount + new_cart.ccount
            oldgood[0].save()
        else:
            new_cart.save()
    except DatabaseError as e:
        logging.warning(e)
    content = {'static': 'OK', 'text': '添加成功'}
    return HttpResponse(json.dumps(content))
    # return render(request,'index.html')
    #     商品数量转换为int
    #     如果有，加上相应数量的商品
    #     没有则直接保存
    # 返回页面

def cart_info(request):
    user_id = request.session.get('user_id')
    find_goods = CartInfo.objects.filter(user_id=user_id)
    return render(request,'cart.html',{"find_goods":find_goods})

def order(request):
    user_id = request.session.get('user_id')
    adss = userinfo.views.Address.objects.filter(user_id=user_id)
    content = {"adss":adss}
    return render(request,'order.html',content)

def add_order(request):
    user_id = request.session.get('user_id')
    orderdetail = request.POST.get("acot")
    adsname = request.POST.get('adsname')
    adsphone = request.POST.get('adsphone')
    ads = request.POST.get('ads')
    acot = 2
    acount = 32
    orderNo = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    print(orderNo,orderdetail,adsname,adsphone,ads,user_id,acot,acount)
    try:
        user = userinfo.models.UserInfo.objects.get(id=user_id)
        order = Order.objects.create(orderNo=orderNo,
                                     orderdetail=orderdetail,
                                     adsname=adsname,
                                     adsphone=adsphone,
                                     ads=ads,
                                     user=user,
                                     acot=acot,
                                     acount = acount,
                                     )
    except DatabaseError as e:
        logging.warning(e)
    content = {"static":"OK"}
    return HttpResponse(json.dumps(content))

def delete_cart(request):
    user_id = request.session.get('user_id')
    cart_id = request.GET.get('cart_id')
    try:
        delcart = CartInfo.objects.filter(user_id=user_id,id=cart_id)
        delcart.delete()
    except DatabaseError as e:
        logging.warning(e)
    content={"static":"OK","msg":"删除成功"}
    return HttpResponse(json.dumps(content))