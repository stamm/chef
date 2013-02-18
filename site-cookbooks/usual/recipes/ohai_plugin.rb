template "#{node['ohai']['plugin_path']}/system_nginx.rb" do
  source "plugins/system_nginx.rb.erb"
  owner "root"
  group "root"
  mode 00755
  variables(
    :nginx_bin => node.nginx.binary
  )
end

include_recipe "ohai"