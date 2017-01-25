include_recipe "passenger_rbenv::default"
include_recipe "apache2"

%w(libapr1-dev libcurl4-gnutls-dev).each do |pkg|
  package pkg do
    action :upgrade
  end
end

if node["platform_version"] =~ /^16/
  %w(apache2-dev libapr1-dev libaprutil1-dev).each do |pkg|
    package pkg
  end
else
  package 'apache2-prefork-dev' do
    action :upgrade
  end
end

rbenv_script "passenger-install-apache2-module" do
  rbenv_version node[:passenger][:ruby][:version]
  code <<-EOC
    source #{node['apache']['dir']}/envvars
    passenger-install-apache2-module _#{node[:passenger][:version]}_ --auto
  EOC
  creates node[:passenger][:module_path]
end

template "#{node[:apache][:dir]}/mods-available/passenger.conf" do
  source "passenger.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[apache2]"
end

apache_module "passenger" do
  module_path node[:passenger][:module_path]
  enable true
end
