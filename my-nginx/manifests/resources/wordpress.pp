define my-nginx::resources::wordpress(
$host = "${title}",
$listen_ip  = '',
$server_name       = '',
$index          = 'index.html',
$root       = "/data/www/${title}",
$ensure        = '',
$status = '',
$webroot = '',
$makeroot = true,
$type = '',



) 
{
include ::my-nginx::params


$link_ensure = $ensure ? {
 'present' => 'link',
  default => 'absent',
}




file { $host:
    ensure => $ensure,
    path    => "/etc/nginx/sites-available/w3-${host}.conf",
    owner   => 'root',
    #group   => 'root',
    mode    => '0644',
    purge => true,
    content => template('my-nginx/wordpress.erb'),
    require  => Class[my-nginx::install],
    notify  => Class[my-nginx::service],


  }


if $makeroot{
    file { $root:
      ensure  => $webroot,
      owner   => 'www',
      group   => 'www',
      
#recurse => true,
    purge => true,
    force => true,
      mode    => '0755',
      require => Class[my-nginx::config],
    }
    file { "${root}/index.html":
	    owner   => 'www',
	    group   => 'www',
	    mode    => '0644',
	    content => "<b>Wordpress Virtual host ${host} managed by Puppet</b>",
	    require => File[$root],
    }
  }




file { "/etc/nginx/sites-enabled/w3-${host}.conf":
    ensure  => $status,
    mode    => '0644',
    owner   => 'root',
    #group   => 'root',
    target => "/etc/nginx/sites-available/w3-${host}.conf",
    require  => Class[my-nginx::install],
    notify  => Class[my-nginx::service],

}






} #Last
