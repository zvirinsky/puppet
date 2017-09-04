#
class profile::zabbix::client {
  include zabbix::z_repo

  $server_ip = lookup('profile::zabbix::client::server_ip')

  class { 'zabbix::z_client' :
    server_ip  => $server_ip,
  }
}
