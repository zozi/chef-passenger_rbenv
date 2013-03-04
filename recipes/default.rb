include_recipe "rbenv"

rbenv_gem "passenger" do
  rbenv_version node[:passenger][:ruby][:version]
  version node[:passenger][:version]
end
