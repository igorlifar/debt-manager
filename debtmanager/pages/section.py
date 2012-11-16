from django.http import Http404

def get_section(request):
	path = (u'/index' + request.path).strip('/').split('/')
	path = path[1:]
	
	if len(path) == 0:
		return ["index"]
	else:
		if path[0] == "login":
			return ["login"]
			
			
		if path[0] == "wastes":
			if len(path) > 1:
				if path[1] == "list":
					return ["wastes", "list"]

				if path[1] == "my":
					return ["wastes", "my"]
					
				if path[1] == "add":
					return ["wastes", "add"]
			else:
				return ["wastes", "list"]
				
				
		if path[0] == "repayments":
			if len(path) > 1:
				if path[1] == "list":
					return ["repayments", "list"]

				if path[1] == "my":
					return ["repayments", "my"]
					
				if path[1] == "add":
					return ["repayments", "add"]
			else:
				return ["repayments", "list"]
		
		if path[0] == 'summary':
			if request.user.is_superuser:
				return ['summary']

		if path[0] == 'profile':
			return ['profile']
			
	raise Http404