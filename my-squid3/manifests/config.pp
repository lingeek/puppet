class my-squid3::config(
) inherits ::my-squid3::params{

#Directoare

file { $service_dir:
        ensure => directory,
        #owner => 'root',
        #group => 'root',
        #recurse => true,
        #mode => 0755,
        require => Class["my-squid3::install"],
    }



file { $service_file:
    ensure  => 'present',
    #mode    => '0644',
    #owner   => 'root',
    #group   => 'root',
    content => template('my-squid3/default.erb'),
    #notify  => Service['service_name'],
    #require => Package['squid_package'],
    #require  => Class[my-squid3::install],
    notify  => Class[my-squid3::service],
    
  }
}
