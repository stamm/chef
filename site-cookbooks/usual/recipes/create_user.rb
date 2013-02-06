#include_recipe "user"


chef_gem "ruby-shadow"


users = data_bag("users")
puts users.inspect
group "admins" do
  gid 2300
end
admins = []
users.each do |user_name|
  user = data_bag_item("users", user_name)

  puts user.inspect
  admins << user['username'] if user['admin']

  home = "/home/#{user['username']}"
  #user_account user["username"] do
  #  comment   user["comment"]
  #  password  user["password"]
  #  ssh_keys  user["ssh_keys"]
  #end
  user user['username'] do
    uid user['uid']
    gid "admins"
    home home
    shell "/bin/bash"
    password user["password"]
    supports manage_home: true
  end



  directory "#{home}/.config/mc/" do
    owner user['username']
    owner user['username']
    mode 00700
    recursive true
  end

  cookbook_file "#{home}/.config/mc/ini" do
    source "home/.config/mc/ini"
    mode 0644
    owner user['username']
  end

end






# admins can run sudo
package 'sudo'
cookbook_file "/etc/sudoers.d/admins" do
  source "etc/sudoers.d/admins"
  mode 0400
  owner "root"
end