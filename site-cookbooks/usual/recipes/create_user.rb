
group "admins"

chef_gem "ruby-shadow"

user "#{node.login_user.name}" do
  uid 1100
  gid "admins"
  home "/home/#{node.login_user.name}"
  shell "/bin/bash"
  password "#{node.login_user.password}"
end


package 'sudo'
execute "add user #{node.login_user.name} to sudo" do
  command <<EOF
echo "#{node.login_user.name} ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/#{node.login_user.name}
chmod 0440 /etc/sudoers.d/#{node.login_user.name}
EOF
end