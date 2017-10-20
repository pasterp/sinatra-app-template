require 'yaml'
require 'ostruct'

def to_ostruct(object)
  case object
  when Hash
    OpenStruct.new(Hash[object.map {|k, v| [k, to_ostruct(v)] }])
  when Array
    object.map {|x| to_ostruct(x) }
  else
    object
  end
end

class Configuration
  FILENAME = "config/database.yml"

  def initialize
    yaml = YAML.load_file FILENAME
    @config = to_ostruct(yaml)
  end

  def initDB
    if @config.database.type == :sqlite3
      DataMapper.setup(:default, File.join('sqlite3://', Dir.pwd, @config.database.location))
    else
      raise :not_implemented
    end
  end

  def to_s
    "Type : #{@config.database.type}\nLocation: #{@config.database.location}"
  end
end
