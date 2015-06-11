# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

%w(fonts images javascripts stylesheets).each do |dir|
  Rails.application.config.assets.paths <<
    Rails.root.join(*%W(build assets #{dir}))
end

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff2|woff|ttf)$/

Rails.application.config.assets.precompile += %w(
  jquery.js
  modernizr.js
  respond.js
)
