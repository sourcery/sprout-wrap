require 'pathname'

bin_directory = Pathname("#{node['sprout']['home']}/bin")

directory bin_directory.to_s do
  owner node['sprout']['user']
  recursive true
end

script_files = Dir.entries(File.join(__dir__, '..', 'files', 'default', 'scripts')).select  {|f| !File.directory? f}

script_files.each do |script|
  cookbook_file(bin_directory.join(script).to_s) do
    source "scripts/#{script}"
    owner node['sprout']['user']
    mode 0744
  end
end
