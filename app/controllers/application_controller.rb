require 'sinatra/base'

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

  get '/' do 
    haml :index
  end

  get '/sass/*.css' do
    content_type 'text/css', :charset => 'utf-8'
    filename= params[:splat].first
    sass filename.to_sym, :views => 'app/assets/sass'
  end
end