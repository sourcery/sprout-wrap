include_recipe "sprout-base::addloginitem"

package_name = File.basename(node['utc_clock']['url'])
cached_package_path = File.expand_path(package_name, Chef::Config[:file_cache_path])

execute "change ownership of install path" do
  command "chown -R #{node['current_user']} #{node['utc_clock']['install_path']}"
  action :nothing
end

execute "add login item for utc_clock" do
  command %(su #{node['current_user']} -c "addloginitem #{node['utc_clock']['install_path']}")
  action :nothing
end

execute "install utc_clock package" do
  command "installer -allowUntrusted -package  #{cached_package_path} -target /"
  notifies :run, "execute[change ownership of install path]"
  notifies :run, "execute[add login item for utc_clock]"
  action :nothing
end

execute "fetch utc_clock package" do
  command "cd #{Chef::Config[:file_cache_path]} && curl -OL #{node['utc_clock']['url']}"
  notifies :run, "execute[install utc_clock package]"
  not_if "test -d #{node['utc_clock']['install_path']}"
end
