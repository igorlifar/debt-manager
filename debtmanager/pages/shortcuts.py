from django.core.context_processors import csrf
from django.shortcuts import render_to_response
from django.template import Context, loader


def render(section, context, request):
    
    context.update({'section': section})
    context.update(csrf(request))
    
    return render_to_response('page.html', context)
