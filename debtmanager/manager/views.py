from django.http import HttpResponse, Http404
from django.contrib.auth.models import User
from django.shortcuts import render_to_response, redirect
from django.conf import settings
from django.contrib.auth import authenticate, login, logout
from manager.models import *
from utils import calc_to_float


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
		
		return redirect("/repayments/list/")
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

		for u in users:
			if request.POST["credit" + str(u.id)] != "":
				credit = calc_to_float(request.POST["credit" + str(u.id)])
				debet = 0
				if request.POST["debet" + str(u.id)] != "":
					debet = calc_to_float(request.POST["debet" + str(u.id)])
				print debet, " ", credit	
				if credit < -1e-9 or debet < -1e-9:
					return redirect("/value-error1/")
				
				total_credit += credit
				total_debet += debet
				
				machos.append({
					"profile": u.get_profile(),
					"debet": debet,
					"credit": credit
				})
		
		print machos
		
		if len(machos) == 0 or total_credit - 1e-9 > total_debet or total_credit + 1e-9 < total_debet:
			return redirect("/value-error2/")
			
		
		waste = Waste.objects.create(comment = comment, category = cat, amount = total_credit, author = request.user.get_profile())
		
		print waste
		
		for macho in machos:
			WastePart.objects.create(user = macho["profile"], debet = macho["debet"], credit = macho["credit"], waste = waste)
			
		return redirect("/wastes/list/")
	except:
		return redirect("/value-error3/")
