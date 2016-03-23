class my-nginx::install (

) inherits ::my-nginx::params {


package { 'package_name':
provider => $provider,
ensure => $ensure,
#flavor => $flavour,
name => $package_name,
}
#END



}

