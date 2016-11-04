#This is the class for manageing SSH

class ssh (
$sshd_package = hiera('sshd_package'),
$sshd_path = hiera('sshd_path'),
$sshd_path = hiera('sshd_path'),
$sshd_port = hiera('sshd_port'),
$sshd_listen = hiera('sshd_listen'),
$sshd_protocol = hiera('sshd_protocol'),
$sshd_keyfile = hiera('sshd_keyfile'),

$service_ensure = hiera('service_ensure'),
$service_enable = hiera('service_enable'),
$service_name   = hiera('sshd::service'),

)
{
package { $sshd_package:
    ensure => installed,
  }


service { $service_name:
    ensure    => $service_ensure,
    enable    => $service_enable,
    name      => $service_name,
    hasstatus => true,
    require   => [
                  Package["$sshd_package"],
                  File["$sshd_path"],


],
  }


file { $sshd_path:
  ensure  => 'file',
  content => template('ssh/sshd_config.erb'),
  require => Package["$sshd_package"],
  notify => Service["$service_name"],

}



}

