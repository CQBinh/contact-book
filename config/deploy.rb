lock '3.4.0'

set :application, 'contactbook'
set :repo_url, 'git@github.com:CQBinh/contact-book.git'
set :branch, :master
set :deploy_to, '/home/www.appnhe.com/public_html/contactbook'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml config/unicorn.rb}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :system
set :rvm_ruby_version, 'ruby-2.2.3'
set :nginx_config_path, '/etc/nginx/conf.d'

namespace :deploy do

  desc 'Invoke a rake command'
  task :invoke, [:command] => 'deploy:set_rails_env' do |task, args|
    on primary(:app) do
      within current_path do
        with :rails_env => fetch(:rails_env) do
          rake args[:command]
        end
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end
end
