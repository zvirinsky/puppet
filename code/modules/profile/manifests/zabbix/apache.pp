# Documentation
#
class profile::zabbix::apache {

  class { 'apache': }

  include apache::mod::php
}
