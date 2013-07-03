default[:passenger][:version] = "3.0.19"

default[:passenger][:ruby][:root] = "#{node[:rbenv][:root_path]}/versions/#{node[:rbenv][:global]}"
default[:passenger][:ruby][:version] = node[:passenger][:ruby][:root].split("/").last
default[:passenger][:ruby][:binary] = "#{node[:passenger][:ruby][:root]}/bin/ruby"
gem_folder = node[:passenger][:ruby][:version] =~ /1\.8/ ? "1.8" : "1.9.1"
default[:passenger][:ruby][:gems_dir] = "#{node[:passenger][:ruby][:root]}/lib/ruby/gems/#{gem_folder}"

default[:passenger][:root_path] = "#{node[:passenger][:ruby][:gems_dir]}/gems/passenger-#{node[:passenger][:version]}"
mod_folder = node[:passenger][:version] =~ /^4/ ? "libout" : "ext"
default[:passenger][:module_path] = "#{node[:passenger][:root_path]}/#{mod_folder}/apache2/mod_passenger.so"
