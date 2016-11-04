class issue 
#$motd = hiera('node::motd')
{
file { '/etc/issue':
  ensure  => 'file',
  content => template('issue/issue.erb'),
}



}

