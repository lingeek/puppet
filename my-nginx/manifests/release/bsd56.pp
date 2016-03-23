class my-nginx::release::bsd56 {
 file { "/etc/motd":
        ensure => present,
        content => "Role OpenBSD 5.6 Web Server, Puppet Server",
        owner => "root",
        group => "wheel"
    }






}

