load 'deploy/assets'
require "bundler/capistrano"

set :application, "thomaswebsite"
set :repository,  "git@bitbucket.org:tommyvyo/thomasvendetta.com.git"
set :branch, :master
set :deploy_to, '/var/www/rails/thomaswebsite'
set :deploy_via, :remote_cache
set :scm, :git
set :user, "app"

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

after "deploy", "deploy:migrate"

namespace :deploy do
  task :start, :roles => :app, :except => { :no_release => true } do 
    run "cd #{current_path} && #{try_sudo} bundle exec unicorn -c #{unicorn_config} -E #{rails_env} -D"
  end
  task :stop, :roles => :app, :except => { :no_release => true } do 
    run "#{try_sudo} kill `cat #{unicorn_pid}`"
  end
  task :graceful_stop, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s QUIT `cat #{unicorn_pid}`"
  end
  task :reload, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} kill -s USR2 `cat #{unicorn_pid}`"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end



  desc "tail production log files" 

  task :tail_logs, :roles => :app do
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}" 
      break if stream == :err    
    end
  end

end
