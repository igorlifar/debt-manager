from django.http import HttpResponse, Http404
from django.contrib.auth.models import User
from django.shortcuts import render_to_response, redirect
from django.conf import settings
from django.contrib.auth import authenticate, login, logout
from manager.models import *
from utils import calc_to_float
import re

def login_view(request):
	try:
		username = request.POST['login']
		password = request.POST['password']
		
		user = authenticate(username=username, password=password)

		if user is not None and user.is_active:
			login(request, user)
			return redirect("/")
		else:
			return redirect("/login/?wrongdata=1")
	except:
		return redirect("/login/?wrongdata=1")
	
			
def logout_view(request):
	logout(request)
	return redirect("/login/")

def add_repayment(request):
	try:
		payer = request.user.get_profile()
		recipient = User.objects.get(id=int(request.POST['recipient'])).get_profile()
		amount = calc_to_float(request.POST['amount'])
		
		if amount < 1e-2:
			return redirect("/value-error/")
		
		if payer == recipient:
			return redirect("/value-error/")
			
		Repayment.objects.create(payer = payer, recipient = recipient, amount = amount)
		
		return redirect("/repayments/my/")
	except:
		return redirect("/value-error/")


def add_waste(request):
    
	try:
		if request.user.is_anonymous():
			raise Http404
			
			
		comment = request.POST['comment']
		
		if comment == "":
			return redirect("/value-error0/")
			
		cat = Category.objects.get(id=int(request.POST['cat']))
		
		users = User.objects.all()
		
		machos = []
		total_debet = 0
		total_credit = 0
		asterisk_debet = 0
		asterisk_credit = 0
		asterisk_list = []

		for u in users:
			if request.POST["credit" + str(u.id)] or request.POST["debet" + str(u.id)]:
				
				credit = 0
				if re.match(r'^\s*\*\s*$', request.POST["credit" + str(u.id)]):
					asterisk_credit += 1
					asterisk_list.append(len(machos))
				elif request.POST["credit" + str(u.id)]:
					credit = calc_to_float(request.POST["credit" + str(u.id)])
				
				debet = 0
				if re.match(r'^\s*\*\s*$', request.POST["debet" + str(u.id)]):
					asterisk_debet += 1
					asterisk_list.append(len(machos))
				elif request.POST["debet" + str(u.id)]:
					debet = calc_to_float(request.POST["debet" + str(u.id)])
				
				if credit < -1e-9 or debet < -1e-9:
					return redirect("/value-error1/")
				
				total_credit += credit
				total_debet += debet
				
				machos.append({
					"profile": u.get_profile(),
					"debet": debet,
					"credit": credit
				})
		
		if (asterisk_credit != 0) and (asterisk_debet != 0):
			return redirect("/value-error4/")

		asterisk_value = 0
		asterisk_field = ""

		if asterisk_debet != 0:
			asterisk_field = "debet"
			asterisk_value = (total_credit - total_debet) / len(asterisk_list)
			total_debet += asterisk_value * len(asterisk_list)
		elif asterisk_credit != 0:
			asterisk_field = "credit"
			asterisk_value = (total_debet - total_credit) / len(asterisk_list)
			total_credit += asterisk_value * len(asterisk_list)

		for i in asterisk_list:
			machos[i][asterisk_field] = asterisk_value

		if len(machos) == 0 or total_credit - 1e-9 > total_debet or total_credit + 1e-9 < total_debet or asterisk_value < -1e-9:
			return redirect("/value-error2/")
			
		
		waste = Waste.objects.create(comment = comment, category = cat, amount = total_credit, author = request.user.get_profile())
		
		
		for macho in machos:
			WastePart.objects.create(user = macho["profile"], debet = macho["debet"], credit = macho["credit"], waste = waste)
			
		return redirect("/wastes/my/")
	except:
		return redirect("/value-error3/")


def change_pass(request):
	from manager.forms import ChangePasswordForm
	from django.shortcuts import redirect
	if request.method == 'POST':
		form = ChangePasswordForm(request.POST)
		if form.is_valid():
			user = request.user
			user.set_password(form.cleaned_data['pass1'])
			user.save()
			return redirect('/profile/?success')
	return redirect('/profile-error/')