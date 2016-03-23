class my-nginx::release::bsd58 {
 file { "/etc/motd":
        ensure => present,
        content => "Role OpenBSD 5.8 Web Server, Puppet Server",
        owner => "root",
        group => "wheel"
    }






}

