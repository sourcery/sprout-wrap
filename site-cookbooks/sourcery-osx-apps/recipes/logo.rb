sourcery_logo_path = File.expand_path("sourcery-logo.png", Chef::Config[:file_cache_path])

cookbook_file sourcery_logo_path do
  source "sourcery-logo.png"
  mode 0644
end

template "/Library/Preferences/SystemConfiguration/com.apple.Boot.plist" do
  source "com.apple.Boot.plist.erb"
  mode 0644
  owner "root"
  group "admin"
  variables(:boot_logo_path => sourcery_logo_path)
end
