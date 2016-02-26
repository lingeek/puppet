class my-squid3::params {



case $operatingsystem {

'Debian','Ubuntu': {
$package_name  = 'squid3'
$service_name  =  'squid3'
$service_dir   =  '/etc/squid3/'
$service_file  =  '/etc/squid3/squid.conf'
$acl_dir       =  '/etc/squid3/conf.d/acl/'
$acl_file      =  '/etc/squid3/conf.d/acl/acl.conf'
}
'RedHat': {
$package_name  = 'squid'
$service_name  =  'squid'
$service_dir   =  '/etc/squid/'
$service_file  =  '/etc/squid/squid.conf'
$acl_dir       =  '/etc/squid/conf.d/acl/'
$acl_file      =  '/etc/squid/conf.d/acl/acl.conf'

}
'OpenBSD': {
$package_name  = 'squid'
$package_version = '3.5.6'
$service_name  =  'squid'
$service_dir   =  '/etc/squid/'
$service_file  =  '/etc/squid/squid.conf'
$acl_dir       =  '/etc/squid/conf.d/acl/'
$acl_file      =  '/etc/squid/conf.d/acl/acl.conf'


}

default: {
$package_name  = 'squid'
$service_name  =  'squid'
$service_dir   =  '/etc/squid/'
$service_file  =  '/etc/squid/squid.conf'
$acl_dir       =  '/etc/squid/conf.d/acl/'
$acl_file      =  '/etc/squid/conf.d/acl/acl.conf'

}

}






} #Ultima acolada
