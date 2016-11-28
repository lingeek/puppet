#This is the class for manageing SQUID 3

class squid3 (
#This value is from OS YAML file because it's a OS specific package name
$squid3_package = hiera('squid3_package'),
#END

#This values are take from HOST's YAML files
$squid3_enable = hiera('squid3::enable'),
$squid3_main_conf = hiera('squid3::main::conf'),

#THis value is telling us if the service should be enabled on the system
$service_ensure = hiera('squid3::service::active'),
#END

#THis value is telling us if the service should be running or NOT
$service_status = hiera('squid3::service::status'),
#END

#This is the service name which is different from OS to OS
$service_name   = hiera('squid3::service::name'),
#END


#This value is from common.yaml files
$file_file    =hiera(file::file),
#END


)
{
package { $squid3_package:
    ensure => $squid3_enable,
  }


service { $service_name:
    ensure    => $service_ensure,
    enable    => $service_status,
    name      => $service_name,
    hasstatus => true,
    require   => [
                  Package["$squid3_package"],
                  File["$squid3_main_conf"],
],
  }


file { $squid3_main_conf:
  ensure  => $file_file,
  content => template('squid3/main_conf.erb'),
  require => Package["$squid3_package"],
  notify => Service["$service_name"],
}



}#

