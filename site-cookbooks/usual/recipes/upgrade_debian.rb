%w(experimental.list testing.list unstable.list).each do |file|
  cookbook_file "/etc/apt/sources.list.d/#{file}" do
    source "apt/sources.list.d/#{file}"
  end
end

cookbook_file "/etc/apt/preferences" do
  source "apt/preferences"
end