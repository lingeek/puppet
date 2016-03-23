class my-nginx::service (

$service_ensure  = 'running',
$service_enable  = 'true',





) inherits ::my-nginx::params {



service { 'service_name':
provider => $provider,
    ensure    => $service_ensure,
    enable    => $service_enable,
    name      => $service_name,
    hasstatus => true,
    require   => Class['my-nginx::install'],
  }


} #Ultima acolada
