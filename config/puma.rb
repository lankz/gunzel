workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  config =
    ActiveRecord::Base.configurations[Rails.env] ||
    Rails.application \
         .config \
         .database_configuration[Rails.env]

  ActiveRecord::Base.establish_connection(
    config.merge('pool' => ENV['MAX_THREADS'] || 5))
end
