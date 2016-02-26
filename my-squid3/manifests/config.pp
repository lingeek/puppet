class my-squid3::config(
) inherits ::my-squid3::params{

#Directoare

#Create configuration folder
file { $service_dir:
        ensure => directory,
        #owner => 'root',
        #group => 'root',
        recurse => true,
        #mode => 0755,
        require => Class["my-squid3::install"],
    }




#Create conf.d folder
file { $service_config_dir:
        ensure => directory,
        #owner => 'root',
        #group => 'root',
        recurse => true,
        #mode => 0755,
        require => Class["my-squid3::install"],
    }


#Ensure that squid.conf is there
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





#Create acl folder
file { $acl_dir:
        ensure => directory,
        #owner => 'root',
        #group => 'root',
        recurse => true,
        #mode => 0755,
        require => Class["my-squid3::install"],
    }


#Ensure that squid.conf is there
file { $acl_file:
    ensure  => 'present',
    #mode    => '0644',
    #owner   => 'root',
    #group   => 'root',
    content => template('my-squid3/acl.erb'),
    #notify  => Service['service_name'],
    #require => Package['squid_package'],
    #require  => Class[my-squid3::install],
    notify  => Class[my-squid3::service],

  }












}
