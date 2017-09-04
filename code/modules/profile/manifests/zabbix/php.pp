# Class documentation
#
class profile::zabbix::php {
  class { '::php':
    settings  => {
      'PHP/max_execution_time' => '600',
      'PHP/max_input_time'     => '600',
      'PHP/memory_limit'       => '256M',
      'PHP/post_max_size'      => '32M',
      'PHP/upload_max_files'   => '16M',
      'Date/date.timezone'     => 'Europe/Minsk'
    }
  }
}
