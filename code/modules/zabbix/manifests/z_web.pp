#
class zabbix::z_web {

  package { 'zabbix-web-mysql':
    ensure => installed,
  }

  file { '/etc/httpd/conf.d/zabbix.conf':
    ensure  => file,
    source  => 'puppet:///modules/zabbix/zabbix.conf',
    require => Package['zabbix-web-mysql'],
    notify  => Service['httpd'],
  }
}
