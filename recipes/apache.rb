include_recipe "passenger_rbenv::default"
include_recipe "apache2"

%w(apache2-prefork-dev libapr1-dev libcurl4-gnutls-dev).each do |pkg|
  package pkg do
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

%w(conf load).each do |ext|
  template "#{node[:apache][:dir]}/mods-available/passenger.#{ext}" do
    source "passenger.#{ext}.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, "service[apache2]"
  end
end

apache_module "passenger" do
  enable true
end
