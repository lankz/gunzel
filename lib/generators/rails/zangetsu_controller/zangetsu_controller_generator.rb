require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'

module Rails
  class ZangetsuControllerGenerator < Rails::Generators::ScaffoldControllerGenerator
    def self.source_root
      File.expand_path('../templates', __FILE__)
    end
  end
end
