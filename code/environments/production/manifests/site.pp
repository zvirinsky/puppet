## !site.pp ##

# This file (/etc/puppetlabs/puppet/manifests/site.pp) is the main ent
#node ry point
# used when an agent connects to a master and asks for an updated configuration.
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition. (The default node can be omitted
# if you use the console and don't define any other nodes in site.pp. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.)

## Active Configurations ##

# Disable filebucket by default for all File resources:
File { backup => false }

# DEFAULT NODE
# Node definitions in this file are merged with node data from the console. See
# http://docs.puppetlabs.com/guides/language_guide.html#nodes for more on
# node definitions.

# The default node definition matches any node lacking a more specific node
# definition. If there are no other nodes in this file, classes declared here
# will be included in every node's catalog, *in addition* to any classes
# specified in the console for that node.

node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

#node 'puppet-client-e.minsk.epam.com' {
#  package { 'nginx':
#        ensure=>'installed'
#  }
#
#  notify { 'Nginx is installed.':
#  }
#
#  service { 'nginx':
#        ensure=>'running'
#  }
#
#  notify { 'Nginx is running.':
#  }

#}
#node 'puppet-client-e' {
#  include apache
#  include '::mysql::server'
#
#  mysql::db { 'test_mdb':
#    user     => 'test_user',
#    password => 'mypass',
#    host     => 'localhost',
#    grant    => ['SELECT', 'UPDATE'],
#  }


# }
#node 'puppet-client-u' {
#  include apache
#
#  include '::mysql::server'
#
#  mysql::db { 'test_mdb':
#    user     => 'test_user',
#    password => 'mypass',
#    host     => 'localhost',
#    grant    => ['SELECT', 'UPDATE'],
#  }
#
#} 

node zabbix-server {
  include role::z_server
}

node puppet-client-e {
  include role::z_client
}








