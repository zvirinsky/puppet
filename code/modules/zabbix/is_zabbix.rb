Facter.add(:is_zabbix) do
  setcode do
    if File.exist? '/etc/zabbix/zabbix_server.conf'
      'server'
    elsif File.exist? '/etc/zabbix/zabbix_agentd.conf'
      'client'
    else
      'no_zabbix_parts_on_system'
    end
  end
end
