require 'require_all'
require 'data_mapper'

DataMapper::Logger.new($stdout, :debug)

# Persistent file database
DataMapper.setup(:default, File.join('sqlite3://', Dir.pwd, 'app/database.db'))

# Now we can load the models
require_all 'app/models'
DataMapper.finalize

#Finally include the controllers
require_all 'app/controllers'