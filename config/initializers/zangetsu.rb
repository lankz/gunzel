Zangetsu::Application.config.generators do |g|
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'

  # don't generate quite so much cruft when scaffolding
  g.javascripts false
  g.stylesheets false
  g.helper false
  g.jbuilder false

  # don't go overboard with generated specs either
  g.test_framework :rspec,
    :helper_specs => false,
    :request_specs => false,
    :routing_specs => false,
    :view_specs => false

  g.scaffold_controller = 'scaffold_controller'
end

require "devise_controller"

class DeviseController
  before_filter :configure_permitted_parameters
  hide_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end
end
