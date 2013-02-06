#execute 'apt-get update' do
#  command "apt-get update"
#end

package "git-core"
package "mc"
package "htop"

#sed -i 's/squeeze/wheeze/g;s/stable/testing/g' /etc/apt/sources.list ; aptitude update ; aptitude dist-upgrade