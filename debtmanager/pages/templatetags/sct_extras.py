from django import template

register = template.Library()

@register.filter
def section_serialize(section):
	return '-'.join(section)
	

	
	