module G5
  class Railtie < Rails::Railtie
    rake_tasks do
      load 'tasks/user_export.rake'
    end
  end
end
