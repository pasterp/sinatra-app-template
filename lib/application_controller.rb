require 'sinatra/base'

require_relative 'configuration'

class ApplicationController < Sinatra::Base
  configure do
    set :environment, :development
    set :raise_errors, true 
    set :run, false

    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, "CHANGE_ME"
  end
end