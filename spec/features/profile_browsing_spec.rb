require 'rails_helper'

feature 'Profiles browsing' do
  scenario 'shows one person\'s profile' do
    100.times do
      FactoryGirl.create(:user)
    end

    set_github_omniauth
    visit root_path
    click_github_sign_in
    expect(page).to have_content 'user1@example.com'

  end



end
