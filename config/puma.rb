workers Integer(ENV['WEB_CONCURRENCY'] || 2)
min_threads_count = Integer(ENV['MIN_THREADS'] || 8)
max_threads_count = Integer(ENV['MAX_THREADS'] || 12)
threads min_threads_count, max_threads_count

preload_app!

rackup DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end