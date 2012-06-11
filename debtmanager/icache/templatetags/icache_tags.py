from django import template
from django.core.cache import cache
from icache import icache

register = template.Library()

@register.tag(name="icache")
def do_upper(parser, token):

	bits = token.split_contents()[1:]
	tokens, vals = [], []
	for t in bits:
		if t[0] == t[-1] and t[0] in ('"', "'"):
			tokens.append(t[1:-1])
		else:
			vals.append(parser.compile_filter(t))

	nodelist = parser.parse(('endicache',))
	parser.delete_first_token()

	return UpperNode(nodelist, tokens, vals)

class UpperNode(template.Node):
	def __init__(self, nodelist, tokens, vals):
		self.nodelist = nodelist
		self.vals = vals
		self.tokens = tokens

	def render(self, context):
		tokens = self.tokens + map(lambda x: unicode(x.resolve(context, True)), self.vals)
		key = '#'.join(tokens)

		version = icache.get_sum(tokens)
		output = icache.get_versioned(key, version)

		if output is None:
			output = self.nodelist.render(context)
			icache.set_versioned(key, output, version)

		return output