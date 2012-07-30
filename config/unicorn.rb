worker_processes 2
working_directory "/var/www/rails/thomaswebsite/current"

listen "/tmp/unicorn.sock", :backlog => 3000
preload_app true
timeout 30

pid "/var/www/rails/thomaswebsite/current/tmp/pids/unicorn.pid"

stderr_path "/var/www/rails/thomaswebsite/current/log/unicorn.stderr.log"
stdout_path "/var/www/rails/thomaswebsite/current/log/unicorn.stdout.log"


user 'app'
