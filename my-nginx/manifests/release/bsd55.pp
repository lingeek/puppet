class my-nginx::release::bsd55 {
 file { "/etc/motd":
        ensure => present,
        content => "Role OpenBSD 5.5 Web Server, Puppet Server",
        owner => "root",
        group => "wheel"
    }






}

