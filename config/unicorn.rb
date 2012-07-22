worker_processes 2
working_directory "/var/www/rails/thomaswebsite/current"

listen "/var/www/rails/thomaswebsite/current/tmp/unicorn.sock"
preload_app true
timeout 30

pid "/var/www/rails/thomaswebsite/current/tmp/pids/unicorn.pid"

stderr_path "/var/www/rails/thomaswebsite/current/log/unicorn.stderr.log"
stdout_path "/var/www/rails/thomaswebsite/current/log/unicorn.stdout.log"


#work with preload_app, prevent master process from holding db conn.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

#establish db conn after forking process
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
