# Now it's documented
#
class role::z_server {

  contain profile::zabbix::apache
  contain profile::zabbix::client
  contain profile::zabbix::db
  contain profile::zabbix::php
  contain profile::zabbix::server

  Class['profile::zabbix::php']
  -> Class['profile::zabbix::apache']
  -> Class['profile::zabbix::db']
  -> Class['profile::zabbix::server']
  -> Class['profile::zabbix::client']
}
