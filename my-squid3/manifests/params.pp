class my-squid3::params {



case $operatingsystem {

'Debian','Ubuntu': {
$package_name  = 'squid3'
$service_name  =  'squid3'
$service_dir   =  '/etc/squid3/'
$service_file  =  '/etc/squid3/squid.conf'
}
'RedHat': {
$package_name  = 'squid'
$service_name  =  'squid'
$service_dir   =  '/etc/squid/'
$service_file  =  '/etc/squid/squid.conf'
}

default: {
$package_name  = 'squid'
$service_name  =  'squid'
$service_dir   =  '/etc/squid/'
$service_file  =  '/etc/squid/squid.conf'
}

}






} #Ultima acolada
