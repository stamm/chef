#execute 'apt-get update' do
#  command "apt-get update"
#end

include_recipe "usual::ohai_plugin"
# remove this in your prod recipe

puts "Nginx version: #{node.system_nginx.version}" if node['system_nginx']

package "git-core"
package "mc"
package "htop"

#sed -i 's/squeeze/wheeze/g;s/stable/testing/g' /etc/apt/sources.list ; aptitude update ; aptitude dist-upgrade