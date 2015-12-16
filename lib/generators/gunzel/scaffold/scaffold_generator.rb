require 'rails/generators/erb/scaffold/scaffold_generator'

module Gunzel
  module Generators
    class ScaffoldGenerator < Erb::Generators::ScaffoldGenerator
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

      def search_attributes
        attributes.select { |a| a.type == :string || a.type == :text }
      end

      def search_field
        "#{search_attributes.map(&:name).join('_or_')}_cont"
      end

      protected

      def available_views
        super + %w(_search _table _tabs)
      end

      def hidden_attribute_names
        %w(children_count deleted_at depth lft lock_version parent_id position
           rgt slug)
      end
    end
  end
end
