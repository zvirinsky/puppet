#
class zabbix::z_server (
  String $database = 'hiera',
  String $user = 'hiera',
  String $user_pass = 'Hiera_2017',
  String $grant = 'ALL'
) {

  package { 'zabbix-server-mysql':
    ensure => installed,
    before => Service['zabbix-server'],
  }

  mysql::db { $database:
      ensure         => 'present',
      user           => $user,
      password       => $user_pass,
      host           => 'localhost',
      charset        => 'utf8',
      collate        => 'utf8_bin',
      grant          => [$grant],
      sql            => '/usr/share/doc/zabbix-server-mysql-*/create.sql.gz',
      import_cat_cmd => 'zcat',
      import_timeout => 600,
      before         => Service['zabbix-server'],
      require        => Package['zabbix-server-mysql'],
  }

  file { '/etc/zabbix/web/zabbix.conf.php':
    ensure  => file,
    content => template('zabbix/zabbix.conf.php.erb'),
    require => Package['zabbix-server-mysql'],
    notify  => Service['zabbix-server'],
  }

  file { '/etc/zabbix/zabbix_server.conf':
    ensure  => file,
    content => template('zabbix/zabbix_server.conf.erb'),
    require => Package['zabbix-server-mysql'],
    notify  => Service['zabbix-server'],
  }

  firewalld_port { 'Open port 80 for Zabbix':
    ensure   => present,
    zone     => 'public',
    port     => 80,
    protocol => 'tcp',
    before   => Service['zabbix-server'],
  }

  if $facts['selinux'] == true {
    selboolean { 'httpd_can_connect_zabbix':
      persistent => true,
      value      => 'on',
      before     => Service['zabbix-server'],
    }
  }

  service { 'zabbix-server':
    ensure => running,
    enable => true,
  }
}
