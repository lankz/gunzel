namespace :assets do
  task :prepare => :environment do
    require 'rails/generators'

    Rails::Generators.invoke('zangetsu:assets')

    Rails.application.config.assets.paths +=
      Dir.glob(Rails.root.join(*%w(build assets *))) \
         .select { |p| File.directory?(p) }
  end
end

Rake::Task['assets:precompile'].enhance(%w(assets:prepare))
