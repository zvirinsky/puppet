#
class profile::zabbix::server {

  $database = lookup('profile::zabbix::server::database')
  $user = lookup('profile::zabbix::server::user')
  $user_pass = lookup('profile::zabbix::server::user_pass')
  $grant = lookup('profile::zabbix::server::grant')

  class { 'zabbix::z_server' :
    database  => $database,
    user      => $user,
    user_pass => $user_pass,
    grant     => $grant,
  }

  contain zabbix::z_repo
  contain zabbix::z_web
  contain zabbix::z_server

  Class['zabbix::z_repo']
  -> Class['zabbix::z_web']
  -> Class['zabbix::z_server']
}
