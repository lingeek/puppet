class my-nginx::release::bsd57 {
 file { "/etc/motd":
        ensure => present,
        content => "Role OpenBSD 5.7 Web Server, Puppet Server",
        owner => "root",
        group => "wheel"
    }






}

