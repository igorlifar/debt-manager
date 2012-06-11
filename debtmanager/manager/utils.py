import re

def calc_to_float(value):
    if re.match(r'^[ \d\(\)\*\+\-\/\.]*$', value) == None or re.search(r'\*\*', value) != None:
        raise SyntaxError
    return float(eval(value))
