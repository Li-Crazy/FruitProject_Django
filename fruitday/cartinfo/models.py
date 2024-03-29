from django.db import models
# Create your models here.

ORDERSTATUS = (
    (1,'未支付',),
    (2,'已支付',),
    (3,'订单取消',),
)

class CartInfo(models.Model):
    user = models.ForeignKey('userinfo.UserInfo',db_column='user_id',
                             on_delete=models.CASCADE)
    good = models.ForeignKey('memberapp.Goods',db_column='good_id',
                              on_delete=models.CASCADE)
    ccount = models.IntegerField('数量',db_column='cart_count')

    def __str__(self):
        return self.user.uname

class Order(models.Model):
    orderNo = models.CharField('订单号',max_length=50)
    orderdetail = models.TextField('订单详情')
    adsname = models.CharField('收件人',max_length=50,null=False)
    adsphone = models.CharField('收件人电话',max_length=20)
    ads = models.CharField('地址',max_length=300)
    time = models.DateTimeField(auto_now=True)
    acot = models.IntegerField('总数')
    acount = models.DecimalField('总价',max_digits=8,decimal_places=2)
    orderstatus = models.IntegerField('订单',choices=ORDERSTATUS,default='1')
    user = models.ForeignKey('userinfo.UserInfo')

    def __str__(self):
        return self.orderNo