require 'generators/haml/scaffold/scaffold_generator'

module Zangetsu
  module Generators
    class ScaffoldGenerator < Haml::Generators::ScaffoldGenerator
      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def available_views
        %w(index edit show new _table)
      end
    end
  end
end
