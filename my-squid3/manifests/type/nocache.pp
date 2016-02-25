define my-squid3::type::nocache (

$http_port                     = undef,
$visible_hostname              = undef,
$access_log                    = undef,
$template                      = 'my-squid3/main_file.erb',
$squid_user                    = 'squid',
$squid_group                   = 'squid',
$service_ensure                = 'running',













  $domains            = [ 'localhost' ],
  $enable             = true,
  $ipv6               = false,
  $ipv4               = false,
  $ipv6only           = false,
  $ipv4only           = false,
  $https              = false,
  $ssl_cert_source    = false,
  $ssl_key_source     = false,
  $ssl_cert_content   = false,
  $ssl_key_content    = false,
  $ssl_ocsp_dns1      = false,
  $ssl_ocsp_dns2      = false,
  $port               = -1,
  $upload_max_size    = '100M',
  $injectionsafe      = false,
  $use_php            = false,
  $php_AcceptPathInfo = false,
  $add_config_source  = false,
  $add_config_content = false,
  $htpasswd           = false,
  $htpasswd_msg       = "Restricted",
  $forbidden          = false,
  $files_dir          = "/var/www/${name}/",
  $try_files          = '=404',
  $listing            = false
) {

  if ($ssl_cert_source or $ssl_key_source or $ssl_cert_content
    or $ssl_key_content) and !$https {

    fail('Use a certificate without enable https does not make sense.')
  }

  if $https and ((!$ssl_cert_source and !$ssl_cert_content)
    or (!$ssl_key_source and !$ssl_key_content)) {

    fail('To have a https connection, please define a cert_pem AND a cert_key.')
  }

  if ($ssl_ocsp_dns1 or $ssl_ocsp_dns2) and !$https {
    fail('Use OCSP DNS resolvers without enable https does not make sense.')
  }

  if $ipv6only and $ipv4only {
    fail('Using ipv6only with ipv4only does not make sens.')
  }

  if $ipv4 and $ipv4 != '' and $ipv6only {
    fail('Defining an IPv4 with ipv6only true is not consistent.')
  }

  if $ipv6 and $ipv6 != '' and $ipv4only {
    fail('Defining an IPv6 with ipv4only true is not consistent.')
  }

  if $php_AcceptPathInfo and !$use_php {
    warning('AcceptPathInfo activated has no sens if PHP is not used.')
  }

  if $add_config_source and $add_config_content {
    fail('Use source/content method to define add_config but not the both.')
  }

  if $htpasswd_msg != 'Restricted' and !$htpasswd {
    fail('You need to use htpasswd with htpasswd_msg.')
  }

  if $use_php {
    notice('Use PHP in at least 1 vhost implies to use enable_php in init.')
    notice('Add if it is not already, otherwise ignore this notice.')
  }

  if $port == -1 {
    $portval = $https ? { true => 443, false => 80 }
  } else {
    $portval = $port
  }

  if $https {
    nginxpack::ssl::certificate { $name:
      ssl_cert_source  => $ssl_cert_source,
      ssl_key_source   => $ssl_key_source,
      ssl_cert_content => $ssl_cert_content,
      ssl_key_content  => $ssl_key_content,
    }
  }

  file { "/etc/nginx/sites-available/${name}":
    ensure  => file,
    mode    => '0644',
    content => template('nginxpack/nginx/vhost.erb'),
    require => [
      Package['nginx'],
      Exec["mkdir_${files_dir}"],
      File["/var/log/nginx/${name}/"],
    ],
    notify  => [
      Exec['find_default_listen'],
      Service['nginx'],
    ],
  }

  exec { "mkdir_${files_dir}":
    command => "/bin/mkdir -p ${files_dir}",
    unless  => "/usr/bin/test -d ${files_dir}",
  }

  file { "/var/log/nginx/${name}/":
    ensure => directory,
    mode   => '0770',
    owner  => 'root',
    group  => 'root',
  }

  if $htpasswd {
    file { "/etc/nginx/htpasswd/${name}":
      ensure  => file,
      owner   => 'www-data',
      group   => 'www-data',
      mode    => '0440',
      content => $htpasswd,
    }
  } else {
    file { "/etc/nginx/htpasswd/${name}":
      ensure => absent,
    }
  }

  $ensure_enable = $enable ? {
    true  => link,
    false => absent,
  }

  file { "/etc/nginx/sites-enabled/${name}":
    ensure  => $ensure_enable,
    target  => "/etc/nginx/sites-available/${name}",
    require => File["/etc/nginx/sites-available/${name}"],
    notify  => [
      Exec['find_default_listen'],
      Service['nginx'],
    ],
  }

  if $add_config_source {
    file { "/etc/nginx/include/${name}.conf":
      ensure => file,
      mode   => '0644',
      source => $add_config_source,
    }
  }

  if $add_config_content {
    file { "/etc/nginx/include/${name}.conf":
      ensure  => file,
      mode    => '0644',
      content => $add_config_content,
    }
  }
}
