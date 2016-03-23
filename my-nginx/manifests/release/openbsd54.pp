class my-nginx::release::openbsd54 {
 file { "/etc/motd":
        ensure => present,
        content => "New OpenBSD 5.4 Web Server",
        owner => "root",
        group => "wheel"
    }






}

