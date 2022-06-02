feature "Attacking" do
#   scenario "Player 1 attacks player 2" do
#     sign_in_and_play
#     click_button "Attack"
#     expect(page).to have_content "Charlotte attacked Mittens"
#   end

  scenario 'reduce Player 2 HP by 10' do
    sign_in_and_play
    click_link 'Attack'
    #click_button 'Attack'
    #click_link 'OK'
    expect(page).not_to have_content 'Mittens: 60HP'
    expect(page).to have_content 'Mittens: 50HP'
  end
end