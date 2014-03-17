Rails.application.instance_eval do
  # because including all helpers, all the time is a bad idea
  config.action_controller.include_all_helpers = false

  config.generators do |g|
    g.fixture_replacement :factory_girl, :dir => 'spec/factories'

    # don't generate quite so much cruft when scaffolding
    g.javascripts false
    g.stylesheets false
    g.helper false

    # don't go overboard with generated specs either
    g.test_framework :rspec,
      :helper_specs => false,
      :request_specs => false,
      :routing_specs => false,
      :view_specs => false

    g.scaffold_controller = 'scaffold_controller'
  end
end
