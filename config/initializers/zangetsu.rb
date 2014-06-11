require "zangetsu/gem_ext/devise/permit_username_and_login_parameters"

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
