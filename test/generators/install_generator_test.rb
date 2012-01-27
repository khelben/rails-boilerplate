require 'test_helper'
require 'generators/generators_test_helper'
require 'generators/boilerplate/install/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  include GeneratorsTestHelper
  tests Boilerplate::Generators::InstallGenerator

  def setup
    mkdir_p "#{destination_root}/app/assets/stylesheets"
    mkdir_p "#{destination_root}/app/assets/javascripts"
    mkdir_p "#{destination_root}/config/environments"
    cp fixture("application.css"), "#{destination_root}/app/assets/stylesheets"
    cp fixture("application.js"), "#{destination_root}/app/assets/javascripts"
    cp fixture("production.rb"), "#{destination_root}/config/environments"
    super
  end

  test "copies index.html to app/views/layouts/application.html.erb" do
    run_generator

    assert_file 'app/views/layouts/application.html.erb'
  end

  test "adds reset.css to the top of the application.css" do
    run_generator

    assert_file 'app/assets/stylesheets/application.css' do |application|
      assert_match /require reset.*require_self/m, application
    end
  end

  test "adds plugins.js to the top of the application.js" do
    run_generator

    assert_file "app/assets/javascripts/application.js" do |application|
      assert_match /\/\/= require plugins[^\/]+\/\/= require jquery/m, application
    end

  end

  test "copies public files" do
    run_generator

    %w{robots.txt crossdomain.xml humans.txt favicon.ico apple-touch-icon-114x114-precomposed.png apple-touch-icon-57x57-precomposed.png apple-touch-icon-72x72-precomposed.png apple-touch-icon-precomposed.png apple-touch-icon.png}.each do |f|
      assert_file "public/#{f}"
    end
  end

  test "adds modernizr.js to the config.assets.precompile" do
    run_generator

    assert_file "config/environments/production.rb" do |production|
      assert_match /^\s*config.assets.precompile \+= %w\( modernizr.js \)$/, production
    end
  end

  def fixture(file)
    File.expand_path("fixtures/#{file}", File.dirname(__FILE__))
  end
end
