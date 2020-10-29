feature 'Hit point display' do
    scenario 'see player 2 hit points' do
        sign_in_and_play
        expect(page).to have_content 'Mittens: 100HP'
    end

    scenario 'see player 1 hit points' do
        sign_in_and_play
        expect(page).to have_content 'Dave: 100HP'
    end
end