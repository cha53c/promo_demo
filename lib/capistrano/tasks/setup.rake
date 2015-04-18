namespace :setup do
  desc 'My first cap task'
  task :first_task do
    on roles(:app) do
     puts 'Your first task has run'
    end
  end
end
