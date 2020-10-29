feature 'Attacking' do
    scenario 'Attack player 2' do
        sign_in_and_play
        click_link 'Attack'
        expect(page).to have_content 'Dave has attacked Mittens'
        expect(page).to have_content 'Mittens lost 10 HP'
    end
end