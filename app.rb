require 'sinatra/base'
require 'sinatra/reloader'

class Battle < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end
  enable :sessions
    
  # our routes would go here
    
    # get '/' do
    #   'Testing infrastructure working!'
    # end

    get '/' do
      erb :index
    end  


    post '/names' do
      session[:player_1_name] = params[:player_1_name]
      session[:player_2_name] = params[:player_2_name]
      redirect '/play'
    end

    get '/play' do
      @player_1_name = session[:player_1_name]
      @player_2_name = session[:player_2_name]
      erb :play
    end


  # # Start the server if this file is executed directly (do not change the line below)
  
  run! if app_file ==$0
end



