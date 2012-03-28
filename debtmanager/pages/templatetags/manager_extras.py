from django import template

register = template.Library()

@register.filter
def precision(value, arg):
	return ("%." + str(arg) + "f") % float(value)
	

	
	