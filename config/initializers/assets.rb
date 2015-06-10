# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

Rails.application.config.assets.paths +=
  Dir.glob(Rails.root.join(*%w(build assets * *))) \
     .select { |p| File.directory?(p) }

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w(
  jquery.js
  modernizr.js
  respond.src.js
  bootstrap/glyphicons-halflings-regular.*
  fontawesome-webfont.*
)
