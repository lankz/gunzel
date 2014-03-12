<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  # extends ....................................................................
  # includes ...................................................................
  # constants ..................................................................
  # filters ....................................................................
  # helpers ....................................................................
  # scopes .....................................................................

  has_scope :page, :default => 1

  # additional config ..........................................................

  respond_to :html
  responders :flash, :http_cache

  # controller actions .........................................................

  def index
    @<%= plural_table_name %> ||= apply_scopes(<%= orm_class.all(class_name) %>)
    respond_with(@<%= plural_table_name %>)
  end

  def show
    @<%= singular_table_name %> ||= <%= orm_class.find(class_name, "params[:id]") %>
    respond_with(@<%= singular_table_name %>)
  end

  def new
    @<%= singular_table_name %> ||= <%= orm_class.build(class_name) %>
    respond_with(@<%= singular_table_name %>)
  end

  def edit
    @<%= singular_table_name %> ||= <%= orm_class.find(class_name, "params[:id]") %>
    respond_with(@<%= singular_table_name %>)
  end

  def create
    @<%= singular_table_name %> ||= <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      respond_with(@<%= singular_table_name %>, :location => @<%= singular_table_name %>)
    else
      respond_with(@<%= singular_table_name %>)
    end
  end

  def update
    @<%= singular_table_name %> ||= <%= orm_class.find(class_name, "params[:id]") %>

    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      respond_with(@<%= singular_table_name %>, :location => @<%= singular_table_name %>)
    else
      respond_with(@<%= singular_table_name %>)
    end
  end

  def destroy
    @<%= singular_table_name %> ||= <%= orm_class.find(class_name, "params[:id]") %>

    if @<%= orm_instance.destroy %>
      respond_with(@<%= singular_table_name %>, :location => <%= index_helper %>_url)
    else
      respond_with(@<%= singular_table_name %>)
    end
  end

  # protected instance methods .................................................

  protected

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params[<%= ":#{singular_table_name}" %>]
    <%- else -%>
    params.require(<%= ":#{singular_table_name}" %>) \
          .permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end

  # private instance methods ...................................................
end
<% end -%>
