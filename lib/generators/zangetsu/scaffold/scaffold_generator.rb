require 'generators/haml/scaffold/scaffold_generator'

module Zangetsu
  module Generators
    class ScaffoldGenerator < Haml::Generators::ScaffoldGenerator
      def self.source_root
        File.expand_path("../templates", __FILE__)
      end
    end
  end
end
