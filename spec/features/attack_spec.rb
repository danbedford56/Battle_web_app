feature 'Attacking' do
    scenario 'Attack player 2' do
        sign_in_and_play
        click_button 'Attack'
        expect(page).to have_content 'Dave has attacked Mittens'
        expect(page).to have_content 'Mittens lost 10 HP'
    end

    scenario 'Be attacked by player 2' do
        sign_in_and_play
        attack_and_ok
        click_button "Attack"
        expect(page).to have_content 'Mittens has attacked Dave'
        expect(page).to have_content 'Dave lost 10 HP'
    end
end