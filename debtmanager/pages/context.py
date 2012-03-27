from manager.models import *
from django.contrib.auth.models import User
from django.db.models import Q

def get_context(section, request):
	res = {
		"static": "/static_files/"
	}
	
	if request.user.is_anonymous():
		res["user"] = {
			"is_anonymous": True
		}
	else:
		res["user"] = {
			"is_anonymous": False,
			"name": request.user.first_name + u' ' + request.user.last_name
		}
		
	
	if section[0] == "repayments":
		if len(section) >= 2 and section[1] == "list":
			rp = Repayment.objects.all().order_by('-date')
			
			r = []
			for p in rp:
				r.append(p.get_ctx())
			
			res["repayments"] = r
		
		if len(section) >= 2 and section[1] == "add":
			members = User.objects.all().exclude(id=request.user.id)
			
			m = []
			for p in members:
				m.append(p.get_profile().get_ctx())
				
			res["members"] = m
			
	if section[0] == "wastes":
		if len(section) >= 2 and section[1] == "list":
			members = User.objects.all()
			
			mp = {}
			
			mbrs = []
			
			for m in members:
				mp[str(m.id)] = len(mbrs)
				mbrs.append(m.get_profile().get_ctx())
				
			wastes = Waste.objects.all().order_by('-date')
			
			ws = []
			
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
					
				ws.append(c)
			
			res["wastes"] = ws
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
				
		
				
	
	return res