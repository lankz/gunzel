require 'rails_helper'

<% module_namespacing do -%>
RSpec.describe <%= class_name %>, :type => :model do
  # subject { described_class }

  # context 'initialized' do
  #   subject { build(:<%= singular_table_name %>) }
  # end

  # context 'persisted' do
  #   subject { create(:<%= singular_table_name %>) }
  # end

  pending "add some examples to (or delete) #{__FILE__}"
end
<% end -%>
