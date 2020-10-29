require 'player'

RSpec.describe Player do
    subject(:dave) { Player.new("Dave") }

    describe 'name' do
        it 'Returns the name' do
            expect(dave.name).to eq 'Dave'
        end
    end

    describe 'hp' do
        it 'Returns the hp of the player' do
            expect(dave.hp).to eq 100
        end
    end

    describe 'take_damage' do
        it 'Takes 10HP away from the player' do
            expect {dave.take_damage}.to change{dave.hp}.by(-10)
        end
    end
end
