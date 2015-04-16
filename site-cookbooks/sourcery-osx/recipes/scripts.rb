require 'pathname'

bin_directory = Pathname("/Users/#{node['sprout']['user']}/bin")

directory bin_directory.to_s do
  owner node['sprout']['user']
  recursive true
end

cookbook_file(bin_directory.join('run_failed_specs').to_s) do
  source "run_failed_specs"
  owner node['sprout']['user']
  mode 0744
end

cookbook_file(bin_directory.join('failed_specs').to_s) do
  source "failed_specs"
  owner node['sprout']['user']
  mode 0744
end
