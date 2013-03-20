
puts "platform: #{node['platform']}" if node['platform']
puts "platform version: #{node['platform_version']}" if node['platform_version']


if node['platform'] == 'debian' && node['platform_version'].to_i <= 6
  %w(experimental.list testing.list unstable.list).each do |file|
    cookbook_file "/etc/apt/sources.list.d/#{file}" do
      source "apt/sources.list.d/#{file}"
    end
  end

  cookbook_file "/etc/apt/preferences" do
    source "apt/preferences"
  end


  execute 'apt-get update' do
    command 'apt-get -y update'
  end

  execute 'apt-get install apt dpkg aptitude' do
    command 'apt-get -y install apt dpkg aptitude'
  end

  execute 'apt-get dist-upgrade' do
    command 'apt-get -y dist-upgrade'
  end

  execute 'reboot' do
    command 'reboot'
  end
end
