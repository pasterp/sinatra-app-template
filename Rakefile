task default: %w[sinatra:start]

namespace :sinatra do
  desc "Start Sinatra Application"
  task :start do
    sh "shotgun"
  end  
  
  desc "Show a list of the sinatra routes"
  task :showRoutes do
    require 'require_all'
    require_all 'app/controllers'

    ObjectSpace.each_object(ApplicationController.singleton_class) {|klass|
      if klass != ApplicationController 
        puts "[#{klass}]:"
        klass.routes.each { |route|
          if route[0] != "HEAD"
            route[1].each{ |r|
              puts "\t#{route[0]} #{r[0]}"
          }
          end
        }
      end
    }
  end
end

namespace :db do
  require 'require_all'
  require 'data_mapper'

  desc "Migrate the database"
  task :migrate do
    DataMapper.setup(:default, File.join('sqlite3://', Dir.pwd, 'app/database.db'))
    require_all 'app/models'  
    DataMapper.finalize
    DataMapper.auto_upgrade!
  end

  desc "Seed the database"
  task :seeds do
    puts "WIP"
  end

  desc "Show your actual config"
  task :showConfig do
    puts "WIP Configuration"
  end

  desc "Empty the database"
  task :dump do
    DataMapper.setup(:default, File.join('sqlite3://', Dir.pwd, 'app/database.db'))
    require_all 'app/models'  
    DataMapper.finalize

    DataMapper::Model.descendants.entries.each { |model|
      puts "Deletings all #{model}"
      model.all.destroy
    }
  end
end
