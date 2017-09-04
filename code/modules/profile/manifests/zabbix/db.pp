# docs
# 
class profile::zabbix::db (
  String $root_pass = 'password',
) {

  class { '::mysql::server':
    root_password => $root_pass,
  }
}
