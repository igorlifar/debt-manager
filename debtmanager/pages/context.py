from manager.models import *
from django.contrib.auth.models import User
from django.db.models import Q

def get_context(section, request):
	res = {
		"static": "/static_files/"
	}
	
	res["user"] = request.user

	if request.user.is_anonymous():
		res["user"] = {
			"is_anonymous": True
		}
	else:
		res["user"] = {
			"is_anonymous": False,
			"name": request.user.first_name + u' ' + request.user.last_name,
			"id": request.user.id,
			'is_superuser': request.user.is_superuser,
		}
		
	
	if section[0] == "repayments":
		if len(section) >= 2 and section[1] in ("my", "list"):
			def rep_gen():
				rp = Repayment.objects.all().order_by('-date')
				
				r = []
				for p in rp:
					if section[1] == "list":
						yield p.get_ctx()
					elif request.user in (p.payer.user, p.recipient.user):
						yield p.get_ctx()
			
			res["repayments"] = rep_gen()
		
		if len(section) >= 2 and section[1] == "add":
			members = User.objects.all().exclude(id=request.user.id)
			
			m = []
			for p in members:
				m.append(p.get_profile().get_ctx())
				
			res["members"] = m
			
	if section[0] == "wastes":
		if len(section) >= 2 and section[1] in ("my", "list"):
			members = User.objects.all()
			
			mp = {}
			
			mbrs = []
			
			for m in members:
				mp[str(m.id)] = len(mbrs)
				mbrs.append(m.get_profile().get_ctx())
				
			wastes = Waste.objects.all().order_by('-date')
			
			def waste_gen(wastes):
				for waste in wastes:
					wp = waste.parts.all()
					
					c = {
						"amount": str(waste.amount),
						"date": waste.date.strftime("%d.%m.%Y"),
						"comment": waste.comment,
						"columns": [{
							"is_member": False
						}] * len(mbrs)
					}
					
					for p in wp:
						c["columns"][mp[str(p.user.user.id)]] = {
							"is_member": True,
							"member": p.user.get_ctx(),
							"debet": p.debet,
							"credit": p.credit,
						}


					if section[1] == 'list':
						yield c
					elif c["columns"][mp[str(request.user.id)]]["is_member"]:
						yield c
			
			res["wastes"] = waste_gen(wastes)
			res["members"] = mbrs
			
		if len(section) >= 2 and section[1] == "add":
			members = User.objects.all()
			
			mbrs = []
			
			for m in members:
				mbrs.append(m.get_profile().get_ctx())
				
			categories = Category.objects.all()
			cats = []
			
			for cat in categories:
				cats.append(cat.get_ctx())
				
			res["members"] = mbrs
			res["cats"] = cats
	
	if section[0] == "index":
		users = UserProfile.objects.all()
		
		u = []
		for user in users:
			u.append({
				"member": user.get_ctx(),
				"balance": user.balance(),
				"debts": []
			})
			
		for i in u:
			for j in u:
				if i != j:
					if i["balance"] < 0 and j["balance"] > 0:
						t = min(-i["balance"], j["balance"])
						i["balance"] += t
						j["balance"] -= t
						i["debts"].append({
							"amount": t,
							"absamount": t,
							"member": j["member"]
						})
						j["debts"].append({
							"amount": -t,
							"absamount": t,
							"member": i["member"]
						})
		res["member"] = request.user.get_profile().get_ctx()
		res["balance"] = request.user.get_profile().balance()
		res["absbalance"] = abs(res["balance"])
		
		for i in u:
			if i["member"]["id"] == str(request.user.id):
				res["debts"] = i["debts"]
				
		
	if section[0] == 'summary':
		users = UserProfile.objects.all()
		
		u = []
		for user in users:
			u.append({
				"member": user.get_ctx(),
				"balance": user.balance(),
				"debts": []
			})
			
		for i in u:
			for j in u:
				if i != j:
					if i["balance"] < 0 and j["balance"] > 0:
						t = min(-i["balance"], j["balance"])
						i["balance"] += t
						j["balance"] -= t
						i["debts"].append({
							"amount": t,
							"absamount": t,
							"member": j["member"]
						})
						j["debts"].append({
							"amount": -t,
							"absamount": t,
							"member": i["member"]
						})
		res['summary'] = {}
		for cur_user in users:
			res['summary'][cur_user] = {}
			res['summary'][cur_user]["member"] = cur_user.get_ctx()
			res['summary'][cur_user]["balance"] = cur_user.balance()
			res['summary'][cur_user]["absbalance"] = abs(res['summary'][cur_user]["balance"])
			
			for i in u:
				if i["member"]["id"] == str(cur_user.user_id):
					res['summary'][cur_user]["debts"] = i["debts"]
	
	return res
    