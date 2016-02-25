class my-squid3::params {



case $operatingsystem {

'Debian','Ubuntu': {
$package_name  = 'squid3'
$service_name  =  'squid3'
}
'RedHat': {
$package_name  = 'squid'
$service_name  =  'squid'
}

default: {
$package_name  = 'squid'
$service_name  =  'squid'
}

}






} #Ultima acolada
