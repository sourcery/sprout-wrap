include_recipe "homebrew"

package 'imagemagick' do
  options "--with-libtiff --ignore-dependencies"
end

