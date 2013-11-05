module G5
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/g5/export_users.rake'
    end
  end
end
