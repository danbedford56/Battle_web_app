feature 'switching turns' do
    context 'Displaying current turn' do
        scenario 'Start of game' do
            sign_in_and_play
            expect(page).to have_content "Dave's turn"
        end

        scenario 'After 1st turn' do
            sign_in_and_play
            attack_and_ok
            expect(page).not_to have_content "Dave's turn"
            expect(page).to have_content "Mittens's turn"
        end
    end
end