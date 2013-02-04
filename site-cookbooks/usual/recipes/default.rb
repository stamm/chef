package "git"
package "mc"
package "htop"



%w(experimental.list testing.list unstable.list).each do |file|
  cookbook_file "/etc/apt/sources.list.d/#{file}" do
    source "apt/sources.list.d/#{file}"
  end
end

cookbook_file "/etc/apt/preferences" do
  source "apt/preferences"
end
#sed -i 's/squeeze/wheeze/g;s/stable/testing/g' /etc/apt/sources.list ; aptitude update ; aptitude dist-upgrade