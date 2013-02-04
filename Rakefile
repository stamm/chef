desc "Run librarian-chef install to generate library of chefs"
task :lib_chef do
  puts `librarian-chef install`
end

namespace :vagrant do
  task :prepare do
    puts `knife prepare vagrant@localhost -i ~/.vagrant.d/insecure_private_key -p 2222`
  end
end