class my-nginx::config(

) inherits ::my-nginx::params{

#Folders
file { $service_dir:
        ensure => directory,
        recurse => true,
        require => Class["my-nginx::install"],
    }

#Create conf.d folder
file { $service_config_dir:
        ensure => directory,
        owner => $user,
        group => $group,
        recurse => true,
        mode => 0755,
        require => Class["my-nginx::install"],
    }



#Create WebRoot
file { $webroot:
        ensure => directory,
        owner => $user,
        group => $group,
        recurse => true,
        mode => 0755,
        require => Class["my-nginx::install"],
    }


#Sites Available
file { $sites_available:
        ensure => directory,
        owner => $user,
        group => $group,
        recurse => true,
        mode => 0755,
        require => Class["my-nginx::install"],
    }

#Sites Enabled
file { $sites_enabled:
        ensure => directory,
        owner => $user,
        group => $group,
        recurse => true,
        mode => 0755,
        require => Class["my-nginx::install"],
    }
#Configuration files
file { $service_file:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/nginx.conf',
}


file { $service_script:
ensure => 'present',
mode   => '0755',
source => 'puppet:///modules/profiles/nginx',
require => Class["my-nginx::install"],

}




file { $mime_types:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/mime.types',
}



file { $fastcgi_params:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/fastcgi_params',
}


file { $koi_utf:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/koi-utf',
}


file { $koi_win:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/koi-win',
}

file { $scgi_params:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/scgi_params',
}

file { $uwsgi_params:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/uwsgi_params',
}


file { $win_utf:
    ensure  => 'present',
    mode    => '0444',
    owner   => $user,
    group   => $group,
    source => 'puppet:///modules/profiles/win-utf',
}



#END




}#ultima acolada
