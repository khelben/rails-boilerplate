require 'generators/boilerplate/resource_helpers'

module Boilerplate
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      desc 'This generator installs an application.html.erb file conforming to the html5 boilerplate'

      def copy_application
        template 'index.html', "app/views/layouts/application.html.erb"
      end

      def inject_reset_css
        inject_into_file "app/assets/stylesheets/application.css", :before => " *= require_self" do
          " *= require reset\n"
        end
      end
      def inject_plugins_css
        inject_into_file "app/assets/javascripts/application.js", :before => "//= require jquery\n" do
          "//= require plugins\n"
        end
      end
      def inject_assets_precompile
        inject_into_file "config/environments/production.rb", :after => "%w( search.js )\n" do
          " config.assets.precompile += %w( modernizr.js )\n"
        end
      end
      def copies_files
        %w{robots.txt crossdomain.xml humans.txt favicon.ico apple-touch-icon-114x114-precomposed.png apple-touch-icon-57x57-precomposed.png apple-touch-icon-72x72-precomposed.png apple-touch-icon-precomposed.png apple-touch-icon.png}.each do |f|
          copy_file f, "public/#{f}"
        end
      end
    end
  end
end
