namespace :setup do
  desc 'create secret key base'
  task :secret do
    on roles(:app) do
      execute "export KEY=$(cd /var/www/my_app/current && bundle exec rake secret) && echo export SECRET_KEY_BASE=$KEY >> ~/.bashrc"
      execute "source ~/.bashrc"
      execute "env"
    end
  end

  namespace :db do
    desc 'seed db from seeds.rb'
    task :seed do
      on roles(:app) do
       within release_path do
          with rails_env: fetch(:rails_env) do
            execute :rake, "db:schema:load"
            execute :rake, "db:seed"
          end
       end
      end
    end
  end
end

namespace :deploy do
  task :initial => [:deploy, 'setup:secret', 'webapp:start']
end

namespace :test do
  task :verify_deploy do
   ds sh "/Users/chrischase/Dev/jmeter/apache-jmeter-2.13/bin/jmeter -n -t ./test/jmeter/scripts/test_home.jmx -l ./test/jmeter/log/test_home.jtl -j ./log/jmeter.log"
  end
end
