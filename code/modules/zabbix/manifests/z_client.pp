#
class zabbix::z_client (
  String $server_ip = '127.0.0.1',
) {

  package { 'zabbix-agent':
    ensure => installed,
    before => Service['zabbix-agent'],
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => file,
    content => template('zabbix/zabbix_agentd.conf.erb'),
    require => Package['zabbix-agent'],
    notify  => Service['zabbix-agent'],
  }

  service { 'zabbix-agent':
    ensure => running,
    enable => true,
  }
}
