#This is the class for manageing SSH keys

class ssh-keys (
$ssh_authorized_keys = hiera_hash('ssh_authorized_keys', undef)
)
{

if ($ssh_authorized_keys != undef) {
    create_resources('ssh_authorized_key', $ssh_authorized_keys)
  }

}
