class Game
    attr_reader :players, :current_turn
    
    def initialize(player1, player2)
        @players = [player1, player2]
        @current_turn = player1
    end

    def attack(player)
        player.take_damage
    end

    def switch_turns
        @current_turn = opponent_of(@current_turn)
    end

    private
    def opponent_of(check_player)
        @players.select {|player| player != check_player}.first
    end

end