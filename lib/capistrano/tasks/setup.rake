namespace :setup do
  desc 'create secret'
  task :secret do
    on roles(:app) do
      execute "export KEY=$(cd /var/www/my_app/current && rake secret) && echo export SECRET_KEY_BASE=$KEY >> ~/.bashrc"
      execute "source ~/.bashrc"
      execute "env"
    end
  end
end
