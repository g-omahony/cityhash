require 'mkmf'

cxx = ENV['CXX'] || with_config('CXX')
RbConfig::MAKEFILE_CONFIG['CXX'] = cxx if cxx

# Add Homebrew include/lib paths if available
dir_config('cityhash', '/opt/homebrew/include', '/opt/homebrew/lib')

%w{g O3 Wall}.each do |flag|
  flag = "-#{flag}"
  $CPPFLAGS += " #{flag}" unless $CPPFLAGS.split.include? flag
end

create_makefile('cityhash/cityhash')
