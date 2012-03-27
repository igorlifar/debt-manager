from django.conf.urls.defaults import patterns, include, url

urlpatterns = patterns('pages',
	url(r'^$', 'views.index'),
	
	url(r'^wastes/$', 'views.index'),
	url(r'^wastes/list/$', 'views.index'),
	url(r'^wastes/add/$', 'views.index'),
	
	url(r'^repayments/$', 'views.index'),
	url(r'^repayments/list/$', 'views.index'),
	url(r'^repayments/add/$', 'views.index'),
	
	url(r'login/$', 'views.login'),
)