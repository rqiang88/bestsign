module Bestsign
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      desc 'Generate eloan configs'
      source_root File.expand_path('../templates', __FILE__)

      def copy_file
        template 'bestsign.rb', 'config/initializers/bestsign.rb'
      end
    end
  end
end