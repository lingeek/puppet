class my-squid3::install ( 

) inherits ::my-squid3::params {


package { 'package_name':
    ensure => $package_version,
    name   => $package_name,
  }


}
