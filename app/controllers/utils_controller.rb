require_relative '../../lib/application_controller'

class UtilsController < ApplicationController
  get '/sass/*.css' do
    content_type 'text/css', :charset => 'utf-8'
    filename= params[:splat].first
    sass filename.to_sym, :views => 'app/assets/sass'
  end
end