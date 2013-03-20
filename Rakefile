desc "Run librarian-chef install to generate library of chefs"
task :lib_chef do
  exec "bundle exec librarian-chef install"
end

namespace :vg do

  desc "Prepare vagrant host"
  task :prepare do
    exec "knife solo prepare vagrant@localhost -i ~/.vagrant.d/insecure_private_key -p 2222"
  end

  desc "Do vagrant provision"
  task :do do
    exec "bundle exec vagrant provision"
  end
end