begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require "bundler/gem_tasks"
require 'rdoc/task'
require 'fileutils'
include FileUtils

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BackboneRails'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :default => :test

require 'rake/testtask'

desc "Run all tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'copies all necessary files from html5-boilerplate/ to the proper folders'
task :update_files => :patch_files do |t|
  files = {
    # stylesheets
    'html5-boilerplate/css/style.css' => 'vendor/assets/stylesheets/reset.css',
    # javascripts
    'html5-boilerplate/js/libs/modernizr-2.0.6.min.js' => 'vendor/assets/javascripts/modernizr.js',
    'html5-boilerplate/js/plugins.js' => 'vendor/assets/javascripts/plugins.js',
    # public files
    'html5-boilerplate/robots.txt' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/crossdomain.xml' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/favicon.ico' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/apple-touch-icon-114x114-precomposed.png' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/apple-touch-icon-57x57-precomposed.png' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/apple-touch-icon-72x72-precomposed.png' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/apple-touch-icon-precomposed.png' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/apple-touch-icon.png' => 'lib/generators/boilerplate/install/templates',
    'html5-boilerplate/humans.txt' => 'lib/generators/boilerplate/install/templates'
  }

  files.each do |src,dest|
    raise "Cannot find src: #{src}" unless File.exists?(src)
    cp src, dest, :verbose => true
  end
end

task :patch_files do |t|
  patches = {
    "index.html.patch" => %w{html5-boilerplate/index.html lib/generators/boilerplate/install/templates/index.html}
  }

  patches.each do |patch, files|
    src,dest = *files[0..1]
    puts "Patching: #{src} with '#{patch}' (-> #{dest})"
    %x{patch -p3 #{src} -i #{patch} -o #{dest}}
    unless $? == 0
      STDERR.puts "Error with patch '#{patch}' (-> #{dest})"
      exit 1
    end
  end

end
