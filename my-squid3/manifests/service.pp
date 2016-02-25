class my-squid3::service (

$service_ensure  = 'running',
$service_enable  = 'true',





) inherits ::my-squid3::params {



service { 'service_name':
    ensure    => $service_ensure,
    enable    => $service_enable,
    name      => $service_name,
    #restart   => "systemctl restart ${service_name}",
    #path      => [ '/sbin', '/usr/sbin', '/usr/local/etc/rc.d' ],
    hasstatus => true,
    require   => Class['my-squid3::install'],
  }




}

