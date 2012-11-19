from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()
from settings import root_dir

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'debtmanager.views.home', name='home'),
    # url(r'^debtmanager/', include('debtmanager.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^static_files/(?P<path>.*)$',  'django.views.static.serve', {'document_root': '%s/static_files/' % root_dir}),
    url(r'^admin/', include(admin.site.urls)),
    
    url(r'^logout/$', 'manager.views.logout_view'),
    url(r'^login/send/$', 'manager.views.login_view'),
    url(r'^repayments/add/send/$', 'manager.views.add_repayment'),
    url(r'^wastes/add/send/$', 'manager.views.add_waste'),
    url(r'^change_pass/$', 'manager.views.change_pass'),
    
    url(r'', include('pages.urls')),
)
