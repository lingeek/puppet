class my-nginx::params {

$archive_name = "wordpress-${version}.tar.gz"



if ( $operatingsystem == "OpenBSD" ) and ( $operatingsystemrelease == "5.4" ){

$package_name  = 'nginx'
$service_name  =  'nginx'
$service_ensure  = 'running'
$service_enable  = 'true'
$webroot       = ['/data/', '/data/www/']
$ensure        = 'present'
$flavour       = 'nginx'
$provider      = 'openbsd'
$service_dir   =  '/etc/nginx/'
$service_file  =  '/etc/nginx/nginx.conf'
$service_script = '/etc/rc.d/nginx'
$mime_types     =  '/etc/nginx/mime.types'
$fastcgi_params = '/etc/nginx/fastcgi_params'
$koi_utf       = '/etc/nginx/koi-utf'
$koi_win       = '/etc/nginx/koi-win'
$scgi_params   = '/etc/nginx/scgi_params'
$uwsgi_params  = '/etc/nginx/uwsgi_params'
$win_utf       = '/etc/nginx/win-utf'
$service_config_dir = '/etc/nginx/conf.d/'
$sites_available       =  '/etc/nginx/sites-available/'
$sites_enabled = '/etc/nginx/sites-enabled/'
$ssl_dir =  '/etc/nginx/ssl/'
$user          =   'root'
$group         =   'wheel'
#include release::bsd54
    }

if ( $operatingsystem == "OpenBSD" ) and ( $operatingsystemrelease == "5.5" ){

$package_name  = 'nginx'
$service_name  =  'nginx'
$service_ensure  = 'running'
$service_enable  = 'true'
$webroot       = '/data/www/'
$ensure        = 'present'
$flavour       = 'lua'
$provider      = 'openbsd'
$service_dir   =  '/etc/nginx/'
$service_file  =  '/etc/nginx/nginx.conf'
$mime_types     =  '/etc/nginx/mime.types'
$fastcgi_params = '/etc/nginx/fastcgi_params'
$koi_utf       = '/etc/nginx/koi-utf'
$koi_win       = '/etc/nginx/koi-win'
$scgi_params   = '/etc/nginx/scgi_params'
$uwsgi_params  = '/etc/nginx/uwsgi_params'
$win_utf       = '/etc/nginx/win-utf'
$service_config_dir = '/etc/nginx/conf.d/'
$sites_available       =  '/etc/nginx/sites-available/'
$sites_enabled = '/etc/nginx/sites-enabled/'
$ssl_dir =  '/etc/nginx/ssl/'
$user          =   'root'
$group         =   'wheel'

#include release::bsd55
    } 

if ( $operatingsystem == "OpenBSD" ) and ( $operatingsystemrelease == "5.6" ){

$package_name  = 'nginx'
$service_name  =  'nginx'
$service_ensure  = 'running'
$service_enable  = 'true'
$webroot       = '/data/www/'
$ensure        = 'present'
$flavour       = 'lua'
$provider      = 'openbsd'
$service_dir   =  '/etc/nginx/'
$service_file  =  '/etc/nginx/nginx.conf'
$mime_types     =  '/etc/nginx/mime.types'
$fastcgi_params = '/etc/nginx/fastcgi_params'
$koi_utf       = '/etc/nginx/koi-utf'
$koi_win       = '/etc/nginx/koi-win'
$scgi_params   = '/etc/nginx/scgi_params'
$uwsgi_params  = '/etc/nginx/uwsgi_params'
$win_utf       = '/etc/nginx/win-utf'
$service_config_dir = '/etc/nginx/conf.d/'
$sites_available       =  '/etc/nginx/sites-available/'
$sites_enabled = '/etc/nginx/sites-enabled/'
$ssl_dir =  '/etc/nginx/ssl/'
$user          =   'root'
$group         =   'wheel'

#include release::bsd56
    }

if ( $operatingsystem == "OpenBSD" ) and ( $operatingsystemrelease == "5.7" ){

$package_name  = 'nginx'
$service_name  =  'nginx'
$service_ensure  = 'running'
$service_enable  = 'true'
$webroot       = '/data/www/'
$ensure        = 'present'
$flavour       = 'lua'
$provider      = 'openbsd'
$service_dir   =  '/etc/nginx/'
$service_file  =  '/etc/nginx/nginx.conf'
$mime_types     =  '/etc/nginx/mime.types'
$fastcgi_params = '/etc/nginx/fastcgi_params'
$koi_utf       = '/etc/nginx/koi-utf'
$koi_win       = '/etc/nginx/koi-win'
$scgi_params   = '/etc/nginx/scgi_params'
$uwsgi_params  = '/etc/nginx/uwsgi_params'
$win_utf       = '/etc/nginx/win-utf'
$service_config_dir = '/etc/nginx/conf.d/'
$sites_available       =  '/etc/nginx/sites-available/'
$sites_enabled = '/etc/nginx/sites-enabled/'
$ssl_dir =  '/etc/nginx/ssl/'
$user          =   'root'
$group         =   'wheel'


#include release::bsd57
    }

if ( $operatingsystem == "OpenBSD" ) and ( $operatingsystemrelease == "5.8" ){

$package_name  = 'nginx'
$service_name  =  'nginx'
$service_ensure  = 'running'
$service_enable  = 'true'
$webroot       = '/data/www/'
$ensure        = 'present'
$flavour       = 'lua'
$provider      = 'openbsd'
$service_dir   =  '/etc/nginx/'
$service_file  =  '/etc/nginx/nginx.conf'
$mime_types     =  '/etc/nginx/mime.types'
$fastcgi_params = '/etc/nginx/fastcgi_params'
$koi_utf       = '/etc/nginx/koi-utf'
$koi_win       = '/etc/nginx/koi-win'
$scgi_params   = '/etc/nginx/scgi_params'
$uwsgi_params  = '/etc/nginx/uwsgi_params'
$win_utf       = '/etc/nginx/win-utf'
$service_config_dir = '/etc/nginx/conf.d/'
$sites_available       =  '/etc/nginx/sites-available/'
$sites_enabled = '/etc/nginx/sites-enabled/'
$ssl_dir =  '/etc/nginx/ssl/'
$user          =   'root'
$group         =   'wheel'

#include release::bsd58
    }



} #Acolada de la sfarsitul case

