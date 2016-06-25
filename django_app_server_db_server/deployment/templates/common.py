import os.path

# Configuration modules.
from ._installed_apps import *
from ._middleware import *
from ._context_processors import *
from ._email import *
from ._eclaim import *

_ = lambda s: s


# Debugging mode.
DEBUG = False

TEMPLATE_DEBUG = False

# Project root directory.
_path = os.path.join(os.path.dirname(__file__), os.pardir)
BASE_DIR = os.path.abspath(os.path.join(_path, os.pardir))

# SQL scripts directory.
_parpath = os.path.join(BASE_DIR, os.pardir)
SQL_SCRIPTS_DIR = os.path.abspath(os.path.join(_parpath, 'sql_scripts'))

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'wk9&6^ns(71^*i#8&=v#j53-cv#85csvl53zu4dp$w0x(k%zsz'

ALLOWED_HOSTS = ['{{ ansible_eth0.ipv4.address }}']

HOST_URL = 'http://{{ ansible_eth0.ipv4.address }}/'

COMPANY_CODE = 'LHDNM'

LOGIN_URL = '/eclaim/login/'

ROOT_URLCONF = 'eclaim.urls'

WSGI_APPLICATION = 'wsgi.application'

# Absolute path to the directory that holds static files.
STATIC_ROOT = '{{ django_app_home }}/static_files'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/
STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

# Absolute path to the directory that holds media files.
MEDIA_ROOT = '{{ django_app_home }}/media_files'

MEDIA_URL = '/media/'

TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
)

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.join(BASE_DIR, 'templates'),
)

# Django Rest Framework.
REST_FRAMEWORK = {
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': 100
}

# Internationalization.
# https://docs.djangoproject.com/en/1.8/topics/i18n/
LANGUAGE_CODE = 'en'

LANGUAGES = (
    ('en', _('English')),
    ('ms', _('Bahasa Malaysia')),
)

LOCALE_PATHS = (
    os.path.join(BASE_DIR, 'locale'),
)

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# JavaScript Internationalization (i18n)
JS_I18N_PACKAGES = (
    'eclaim.masterfiles',
    'eclaim.settings'
)

# Logging.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt': "%d/%b/%Y %H:%M:%S"
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.handlers.RotatingFileHandler',
            'filename': os.path.abspath('eclaim.log'),
            'formatter': 'verbose'
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'propagate': True,
            'level': 'DEBUG',
        },
        'ECLAIM': {
            'handlers': ['file'],
            'level': 'DEBUG',
        },
    }
}
