import logging

from django.shortcuts import render,redirect
from django.contrib.auth.hashers import make_password,check_password
from django.db import DataError,DatabaseError
# Create your views here.
from .models import UserInfo, Address


def register_in(request):
    return render(request, 'register.html')

def register_(request):
    """判断提交方式是否为post
        声明一个用户
        获取前段用户名
        查询用户
        判断用户长度
            如果大于零，返回注册页，
                提示用户名已存在
        判断两次密码是否一致
            如果不一致，返回注册页，
                提示两次密码不一致
        对密码加密 from django.contrib.auth.hashers import make_password make_password(要加密的内容,'abc','pbkdf2_sha1')
        保存用户信息
        返回首页"""
    if request.method == 'POST':
        new_user = UserInfo()
        #获取注册信息
        new_user.uname = request.POST.get("user_name")

        # 判断用户是否存在
        user = UserInfo.objects.filter(uname=new_user.uname)
        if len(user) > 0:
            return render(request,'register.html',{'msg':'用户已存在'})

        if request.POST.get("user_pwd") != request.POST.get('user_cpwd'):
            return render(request,'register.html',{"msg":'两次密码输入不一致'})

        new_user.upassword = make_password(request.POST.get("user_pwd"),'abc','pbkdf2_sha1')
        print(make_password('qwe','abc','pbkdf2_sha1'))
        print(make_password('qwe','def','pbkdf2_sha1'))
        print(make_password('qwe',None,'pbkdf2_sha1'))
        print(make_password('qwe',None,'pbkdf2_sha1'))
        print(make_password('rty','abc','pbkdf2_sha1'))

        new_user.email = request.POST.get('email')
        new_user.phone = request.POST.get('phone')
        try:
            new_user.save()
        except DatabaseError as e:
            logging.warning(e)
        return render(request,'index.html')
    return redirect('register.html')
        # 注册用户
        # 返回页面

def login_in(request):
    return render(request,'login.html')

def login_(request):
    """
    判断提交方式是否为post
        声明一个用户
        获取前段用户数据
        判断用户是否存在
            不存在返回登录页，提示无此用户
        判断密码是否正确check_password
            不正确，返回登录页，提示用户名密码错误
        保存session用户id,用户名
        返回首页
    返回登录页
    :param request:
    :return:
    """
    # 获取用户信息
    # 判断用户信息是否存在
    # 用户登录
    # 返回页面
    if request.method == 'POST':
        user = UserInfo()
        user.uname = request.POST.get('user_name')
        user.upassword = request.POST.get('user_pwd')
        try:
            find_user = UserInfo.objects.filter(uname=user.uname)
            if len(find_user) < 0:
                return render(request,'login.html',{"msg":"用户不存在"})
            if not check_password(user.upassword,find_user[0].upassword):
                return render(request,'login.html',{"msg":'用户名密码错误'})
        except DatabaseError as e:
            logging.warning(e)

        request.session['user_id'] = find_user[0].id
        request.session['user_name'] = find_user[0].uname

        return render(request,'index.html')
    return redirect('login.html')

def login_out(request):
    try:
        if request.session['user_name']:
            del request.session['user_name']
            del request.session['user_id']
    except KeyError as e:
        logging.warning(e)
    return redirect('/')

def add_ads(request):
    # 获取用户（session中获取）
    user = request.session['user_name']
    # 获取前端页面传来的信息（收件人，地址，电话）
    aname = request.POST.get('aname')
    ads = request.POST.get('ads')
    aphone = request.POST.get('phone')
    # 对数据库进行增加操作
    address = Address(aname=aname,ads=ads,phone=aphone,user=user)
    address.save()
    return render(request,'address.html')
    # 返回页面

def user_ads(request):
    # 获取用户id(session中获取)
    user_id = request.session.get('user_id')
    # 查询数据库Address中该用户id的数据
    adss = Address.objects.filter(user_id=user_id)
    content = {"adss":adss}
    # 返回页面
    return render(request,'',content)

def delete_ads(request):
    # 获取用户id
    # 获取地址id
    # 查询该数据
    # 删除该数据
    # 返回页面
    user_id = request.session.get("user_id")
    adsid = request.GET.get('adsid')

    try:
        delads = Address.objects.get(id=adsid,user_id=user_id)
        delads.delete()
    except DatabaseError as e:
        logging.warning(e)
    return redirect('')