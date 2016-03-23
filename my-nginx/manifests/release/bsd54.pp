class my-nginx::release::bsd54 {
 file { "/etc/motd":
        ensure => present,
        content => "Role OpenBSD 5.4 Web Server, Puppet Server",
        owner => "root",
        group => "wheel"
    }






}

