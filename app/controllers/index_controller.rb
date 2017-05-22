require_relative '../../lib/application_controller'

class IndexController < ApplicationController
  get '/' do 
    haml :index
  end
end