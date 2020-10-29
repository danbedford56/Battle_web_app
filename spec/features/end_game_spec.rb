feature 'End of game' do
    context 'Player 1 is 0HP' do
        before do
            sign_in_and_play
            allow(Kernel).to receive(:rand).and_return 10
            18.times {attack_and_ok}
        end

        scenario 'Player 1 loses' do
            allow(Kernel).to receive(:rand).and_return 10
            click_button "Attack"
            expect(page).to have_content "Mittens loses!"
        end
    end
end