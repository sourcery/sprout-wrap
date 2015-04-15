include_recipe "homebrew"

directory '/usr/local/Library/Taps' do
  owner node['sprout']['user']
  recursive true
end

execute 'tap homebrew/versions' do
  command 'brew tap "homebrew/versions"'
  user node['sprout']['user']
end

# As of 2015-04-15, a downgraded version of PhantomJS (version 1.9.8) is required for file uploads to work
# on the dev boxes - possibly delete this entire recipe and simply add 'phantomjs' to the list of homebrew formula in
# soloistrc at a later date when this downgraded version is no longer necessary:
package 'phantomjs198'
