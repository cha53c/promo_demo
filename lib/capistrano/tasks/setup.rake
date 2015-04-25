namespace :setup do
  desc 'create secret key base'
  task :secret do
    on roles(:app) do
      execute "export KEY=$(cd /var/www/my_app/current && bundle exec rake secret) && echo export SECRET_KEY_BASE=$KEY >> ~/.bashrc"
      execute "source ~/.bashrc"
      execute "env"
    end
  end

  desc 'set up db and seed data'
  task :db do
    on roles(:app) do
      execute "cd /var/www/my_app/current && bundle exec rake db:setup"
    end
  end

  desc 'set up db and seed data'
  task :db_reset do
    on roles(:app) do
      execute "cd /var/www/my_app/current && bundle exec rake db:reset"
    end
  end

end
