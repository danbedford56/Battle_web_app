require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
    run! if app_file == $0
    enable :sessions
    
    get '/' do
        erb(:index)
    end

    post '/names' do
        player_1 = Player.new(params[:player_1_name])
        player_2 = Player.new(params[:player_2_name])
        @game = Game.create(player_1, player_2)
        redirect '/play'
    end

    get '/play' do
        @game = Game.instance
        erb :play
    end

    get '/attack' do
        @has_attacked = session[:has_attacked?]
        @damage = session[:damage]
        @game = Game.instance
        erb :attack
    end

    post '/attack' do
        @game = Game.instance
        session[:damage] = @game.attack(@game.opponent_of(@game.current_turn))
        session[:has_attacked?] = true
        if @game.game_over?
            redirect '/game-over'
        else
            redirect '/attack'
        end
    end

    post '/heal' do
        @game = Game.instance
        session[:has_attacked?] = false
        session[:damage] = @game.heal(@game.current_turn)
        redirect '/attack'
    end

    post '/switch-turns' do
        @game = Game.instance
        @game.switch_turns
        redirect "/play"
    end

    get '/game-over' do
        @game = Game.instance
        erb :game_over
    end

end