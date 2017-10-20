require 'require_all'
require 'data_mapper'


Configuration.new.initDB

DataMapper::Logger.new($stdout, :debug)


# Now we can load the models
require_all 'app/models'
DataMapper.finalize

#Finally include the controllers
require_all 'app/controllers'
