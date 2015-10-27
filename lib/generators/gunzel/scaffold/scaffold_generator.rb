require 'generators/haml/scaffold/scaffold_generator'

module Gunzel
  module Generators
    class ScaffoldGenerator < Haml::Generators::ScaffoldGenerator
      def self.source_root
        File.expand_path("../templates", __FILE__)
      end

      def visible_attributes
        attributes - hidden_attributes
      end

      def hidden_attributes
        attributes.index_by(&:name) \
                  .slice(*hidden_attribute_names) \
                  .values
      end

      protected

      def available_views
        super + %w(_table)
      end

      def hidden_attribute_names
        %w(children_count deleted_at depth lft lock_version parent_id position
           rgt slug)
      end
    end
  end
end
