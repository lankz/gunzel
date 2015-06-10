<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  # extends ....................................................................
  # includes ...................................................................
  # constants ..................................................................
  # filters ....................................................................

  # before_filter :authenticate_user!

  # helpers ....................................................................
  # scopes .....................................................................

  has_scope :page, :default => 1

  # additional config ..........................................................

  respond_to :html
  responders :flash, :http_cache

  # controller actions .........................................................

  def index
    authorize!(:index, <%= class_name %>)

    respond_with(@<%= plural_table_name %> ||= apply_scopes(
      search_<%= plural_table_name %>.result \
             <%= ' ' * plural_table_name.length %>.accessible_by(current_ability)))
  end

  def show
    authorize!(:show, find_<%= singular_table_name %>)
    respond_with(@<%= singular_table_name %>)
  end

  def new
    authorize!(:new, @<%= singular_table_name %> ||= <%= orm_class.build(class_name) %>)
    respond_with(@<%= singular_table_name %>)
  end

  def edit
    authorize!(:edit, find_<%= singular_table_name %>)
    respond_with(@<%= singular_table_name %>)
  end

  def create
    authorize!(:create, @<%= singular_table_name %> ||= <%= orm_class.build(class_name, "#{singular_table_name}_params") %>)

    @<%= singular_table_name %>.save
    respond_with(@<%= singular_table_name %>, :location => @<%= singular_table_name %>)
  end

  def update
    authorize!(:update, find_<%= singular_table_name %>)

    @<%= orm_instance.update("#{singular_table_name}_params") %>
    respond_with(@<%= singular_table_name %>, :location => @<%= singular_table_name %>)
  end

  def destroy
    authorize!(:destroy, find_<%= singular_table_name %>)

    @<%= orm_instance.destroy %>
    respond_with(@<%= singular_table_name %>, :location => <%= index_helper %>_url)
  end

  # protected instance methods .................................................

  protected

  def find_<%= singular_table_name %>
    @<%= singular_table_name %> ||= <%= orm_class.find(class_name, "params[:id]") %>
  end

  def search_<%= plural_table_name %>
    @search ||= <%= class_name %>.ransack(params[:q])
  end

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
