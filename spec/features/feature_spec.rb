require 'rails_helper'

feature 'profiles' do

  context 'no profiles have been added' do
    scenario 'should display a prompt to add profile' do
      visit '/profiles'
      expect(page).to have_content('no profiles yet')
      # expect(page).to have_link('create profile')
    end
  end

  context 'viewing other peoples profiles' do
    scenario 'should display users profile details' do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit "/profiles/#{user.id}"
      expect(page).to have_content("My name is James Brown")
    end
  end

end
