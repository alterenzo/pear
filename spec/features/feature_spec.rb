require 'rails_helper'

feature 'profiles' do

  context 'no profiles have been added' do
    scenario 'should display a prompt to add profile' do
      visit '/profiles'
      expect(page).to have_content('no profiles yet')
      # expect(page).to have_link('create profile')
    end

  end
end
