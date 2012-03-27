from django.http import HttpResponse, Http404
from django.shortcuts import redirect

from pages.section import get_section
from pages.context import get_context
from pages.shortcuts import render

def index(request):
	
	if request.user.is_anonymous():
		return redirect("/login/")
	
	section = get_section(request)
	context = get_context(section, request)
	
	return render(section, context, request)
	
def login(request):
	
	if not request.user.is_anonymous():
		return redirect("/")
	
	section = get_section(request)
	context = get_context(section, request)
	
	return render(section, context, request)