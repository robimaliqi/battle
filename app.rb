require 'sinatra/base'
require 'sinatra/reloader'
require './lib/player.rb'
require './lib/game.rb'

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
      player_1 = Player.new(params[:player_1])
      player_2 = Player.new(params[:player_2])
      $game = Game.new(player_1, player_2)
      redirect '/play'
    end

    get '/play' do
      @game = $game
      erb :play
    end

    
    get '/attack' do
      @game = $game
+     @game.attack(@game.player_2)
      @game.switch_turns
      erb :attack
    end


  # # Start the server if this file is executed directly (do not change the line below)
  
  run! if app_file ==$0
end



