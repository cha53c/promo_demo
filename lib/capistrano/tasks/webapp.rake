namespace :webapp do
  desc 'start web app'
  task :start do
    on roles(:app) do
      execute "cd /var/www/my_app/current"
      execute "/usr/local/rvm/gems/ruby-2.2.1/bin/rails server -d"
    end
  end

  task :start do
    on roles(:app) do
      execute "/etc/rc.d/init.d/nginx start"
    end
  end

  task :stop do
    on roles(:app) do
      execute "/etc/rc.d/init.d/nginx stop"
    end
  end

  task :restart do
    invoke 'webapp:stop'
    invoke 'webapp:start'	
  end

  task :env do
    on roles(:app) do
      execute "env"
    end
  end

end

