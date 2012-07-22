set :application, "thomaswebsite"
set :repository,  "git@bitbucket.org:tommyvyo/thomasvendetta.com.git"
set :branch, :master
set :deploy_to, '/var/www/rails/thomaswebsite'
set :deploy_via, :remote_cache
set :scm, :git
set :user, "thomas"

set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

set :rails_env, :production
set :unicorn_binary, "/home/app/.rbenv/shims/unicorn"
set :unicorn_config, "#{current_path}/config/unicorn.rb"
set :unicorn_pid, "#{current_path}/tmp/pids/unicorn.pid"

ssh_options[:forward_agent] = true
default_run_options[:pty] = true 

role :web, "thomasvendetta.com"                          # Your HTTP server, Apache/etc
role :app, "thomasvendetta.com"                          # This may be the same as your `Web` server
role :db,  "thomasvendetta.com", :primary => true # This is where Rails migrations will run

set :use_sudo, false


