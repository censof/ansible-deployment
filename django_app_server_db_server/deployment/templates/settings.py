"""Production settings and globals.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.8/ref/settings/
"""

from .modules import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'eclaim',
        'USER': 'eclaim',
        'PASSWORD': 'eclaim',
        'HOST': '{{ db_server_ip }}',
        'PORT': '',
    }
}
