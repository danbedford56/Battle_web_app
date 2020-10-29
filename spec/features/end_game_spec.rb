feature 'End of game' do
    context 'Player 1 is 0HP' do
        before do
            sign_in_and_play
            18.times {attack_and_ok}
        end

        scenario 'Player 1 loses' do
            click_button "Attack"
            expect(page).to have_content "Mittens loses!"
        end
    end
end