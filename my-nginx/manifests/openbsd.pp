class my-nginx::vhost (

$squid_cache_dir  = [],
$visible_hostname       = [],
$http_port              = [ '3128' ],
$http_allow             = [],
$snmp_port               = [],
$acl                    = [],
$http_access             = [],
$refresh_pattern        = [],
$coredump_dir           = '/var/spool/squid',
$access_log             = [],
#User setup
$cache_effective_user   = [],
$cache_effective_group  = [],
#END

$server_persistent_connections = true,
$client_persistent_connections = true,


#Default values for TIMEOUTS
$forward_timeout             = [ '4 minutes'],
$connect_timeout             = [ '60 seconds' ],
$read_timeout                = [ '15 minutes' ],
$request_timeout             = [ '3 minutes' ],
$peer_connect_timeout        = ['30 seconds'],
$write_timeout               = ['15 minutes'],
$client_lifetime             = ['1 day'],
$half_closed_clients         = ['off'],
$server_idle_pconn_timeout   = ['1 minute'],
$ident_timeout               = ['10 seconds'],
$shutdown_lifetime           = ['30 seconds'],
$persistent_request_timeout  = ['1 minute'],
$pconn_timeout               = ['2 minutes'],


#END



)inherits ::my-nginx::params {



}#Acolada Sfarsit
