# -*- coding: utf-8 -*-
# Generated by Django 1.11.24 on 2019-09-26 13:01
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=30, verbose_name='商品名称')),
                ('price', models.DecimalField(decimal_places=2, max_digits=8, verbose_name='商品价格')),
                ('desc', models.CharField(default='商品描述', max_length=200, verbose_name='描述')),
                ('unit', models.CharField(max_length=30, verbose_name='单位')),
                ('detail', models.CharField(default='商品详情', max_length=1000, verbose_name='商品详情')),
                ('picture', models.ImageField(default='normal.png', upload_to='static/images/goods', verbose_name='商品图片')),
                ('isdelete', models.BooleanField(default=False, verbose_name='删除')),
            ],
        ),
        migrations.CreateModel(
            name='GoodType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=30, verbose_name='分类名称')),
                ('desc', models.CharField(default='商品描述', max_length=200, verbose_name='描述')),
                ('isdelete', models.BooleanField(default=False, verbose_name='删除')),
            ],
        ),
        migrations.AddField(
            model_name='goods',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='memberapp.GoodType'),
        ),
    ]
