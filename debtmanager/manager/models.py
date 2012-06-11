from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.db.models import Sum
from django.db.models.signals import post_save
from icache import icache

# Create your models here.

class UserProfile(models.Model):
	user = models.OneToOneField(User)
	
	def get_ctx(self):
		return {
			"name": self.user.first_name + u' ' + self.user.last_name,
			"id": str(self.user.id)
		}
		
	def balance(self):
		res = 0
		
		if WastePart.objects.filter(user=self).count() > 0:
			t = WastePart.objects.filter(user=self).aggregate(Sum('debet'), Sum('credit'))
		
			res += t["debet__sum"] - t["credit__sum"]
		
		if Repayment.objects.filter(payer=self).count() > 0:
			t = Repayment.objects.filter(payer=self).aggregate(Sum('amount'))
		
			res += t["amount__sum"]
		
		if Repayment.objects.filter(recipient=self).count() > 0:
			t = Repayment.objects.filter(recipient=self).aggregate(Sum('amount'))
		
			res -= t['amount__sum']
		
		return res
	
	def __unicode__(self):
		return self.user.username + u'(' + self.user.first_name + u', ' + self.user.last_name + u')'

def create_user_profile(sender, instance, created, **kwargs):
	if created:
		UserProfile.objects.create(user=instance)

post_save.connect(create_user_profile, sender=User)

class Group(models.Model):
	name = models.CharField(max_length=100)
	members = models.ManyToManyField(UserProfile, related_name='groups')

	def __unicode__(self):
		return self.name
	
class Category(models.Model):
	name = models.CharField(max_length=100)
	
	def get_ctx(self):
		return {
			"name": self.name,
			"id": self.id
		}
	
	def __unicode__(self):
		return self.name
	
class Waste(models.Model):
	comment = models.CharField(max_length=500)
	category = models.ForeignKey(Category, related_name='wastes')
	date = models.DateTimeField(auto_now_add=True)
	amount = models.FloatField()
	author = models.ForeignKey(UserProfile, related_name='wastes')
	
	def __unicode__(self):
		return u'[' + self.category.name + u']: ' + self.comment
	
class WastePart(models.Model):
	user = models.ForeignKey(UserProfile, related_name='user_wastes')
	debet = models.FloatField()
	credit = models.FloatField()
	
	waste = models.ForeignKey(Waste, related_name='parts')
	
	def __unicode__(self):
		return self.user.user.username + u' ' + self.waste.__unicode__()
	
class Repayment(models.Model):
	payer = models.ForeignKey(UserProfile, related_name='repayments')
	recipient = models.ForeignKey(UserProfile, related_name='income')
	amount = models.FloatField()
	date = models.DateTimeField(auto_now_add=True)
	
	def get_ctx(self):
		return {
			"payer": self.payer.get_ctx(),
			"recipient": self.recipient.get_ctx(),
			"amount": self.amount,
			"date": self.date.strftime("%d.%m.%Y")
		}
	
	def __unicode__(self):
		return u'from ' + self.payer.user.username + u' to ' + self.recipient.user.username + u' ' + str(self.amount)
	
	
class Template(models.Model):
	category = models.ForeignKey(Category, related_name='templates')
	members = models.ManyToManyField(UserProfile)
	
	def __unicode__(self):
		return self.category.name

def waste_cache_post_save(sender, **kwargs):
    icache.incr('wastes')

post_save.connect(waste_cache_post_save, sender=Waste, dispatch_uid="wastes_cache_post_save")

def repayment_cache_post_save(sender, **kwargs):
    icache.incr('repayments')

post_save.connect(repayment_cache_post_save, sender=Repayment, dispatch_uid="repayments_cache_post_save")


