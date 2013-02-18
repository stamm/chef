%w(public logs).each do |dir|
  directory "#{node.app.web_dir}/#{dir}" do
    owner node.nginx.user
    mode "0755"
    recursive true
  end
end


template "#{node.nginx.dir}/sites-available/#{node.app.name}.conf" do
  source "nginx.conf.erb"
  mode "0644"
end

nginx_site "#{node.app.name}.conf"

cookbook_file "#{node.app.web_dir}/public/index.html" do
  source "index.html"
  mode 0755
  owner node.nginx.user
end