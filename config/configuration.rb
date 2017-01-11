require 'require_all'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)

# Memory database 
# -> DataMapper.setup(:default, 'sqlite::memory:')

# Persistent file database
DataMapper.setup(:default, File.join('sqlite3://', Dir.pwd, 'app/database.db'))

# Now we can load the models
require_all 'app/models'
DataMapper.finalize

# Migrate the database
#DataMapper.auto_upgrade!


#Finally include the controllers
require_all 'app/controllers'