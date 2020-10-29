require 'game'

RSpec.describe Game do
    let(:mittens) { double('Mittens', :hp => 100) }
    let(:dave) { double('Dave', :hp => 100) }
    let(:dead_player) { double('Dead', :hp => 0) }

    subject { Game.new(dave, mittens) }

    describe 'Initialize' do
        it 'Stores 2 player instances' do
            expect(subject.players[0]).not_to eq nil
            expect(subject.players[1]).not_to eq nil
        end
    end

    describe 'attack' do
        it 'Attacks the other player' do
            expect(mittens).to receive(:take_damage)
            subject.attack(mittens)
        end
    end

    describe 'current_turn' do
        it 'Starts as player 1' do
            expect(subject.current_turn).to eq dave
        end
    end

    describe 'switch_turns' do
        it 'Switches the turn' do
             subject.switch_turns
             expect(subject.current_turn).to eq mittens
        end
    end

    describe 'game_over?' do
        it 'Returns false if game is not over' do
            expect(subject.game_over?).to eq false
        end

        it 'Returns true if game is over' do
            finished_game = Game.new(mittens, dead_player)
            expect(finished_game.game_over?).to eq true
        end
    end

    describe 'loser' do
        it 'Returns the losing player' do
            finished_game = Game.new(mittens, dead_player)
            expect(finished_game.loser).to eq dead_player
        end
    end
end