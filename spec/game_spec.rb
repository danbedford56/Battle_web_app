require 'game'

RSpec.describe Game do
    let(:mittens) { double('Mittens') }
    let(:dave) { double('Dave') }

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
end