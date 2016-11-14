class eb3-facts::facts( 
$environment                = hiera('eb3::environment'),
$institute                   =[],
$facts_dir                  = hiera('facts::dir'),
$facts_config_dir             =  hiera('facts::config::dir'),
$facts_file                 =  hiera('facts::file'), 
){

#Create configuration folder
file { $facts_dir:
        ensure => directory,
        recurse => true,
    }


#Create conf.d folder
file { $facts_config_dir:
        ensure => directory,
        recurse => true,
    }


file { $facts_file:
    ensure  => 'present',
    mode    => '0644',
    owner   => 'root',
    content => template('eb3-facts/facts.erb'),
  }




}
