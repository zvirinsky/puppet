#
class zabbix::z_repo {
  yumrepo { 'zabbix':
    baseurl  => 'http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64',
    descr    => 'zabbix repo',
    gpgkey   => 'https://repo.zabbix.com/RPM-GPG-KEY-ZABBIX-A14FE591',
    enabled  => 1,
    gpgcheck => 1,
  }
}

