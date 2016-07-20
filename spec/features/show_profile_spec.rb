require 'rails_helper'

feature 'profiles' do

  context 'viewing other peoples profiles' do
    scenario 'should display users profile details' do
      user = FactoryGirl.create(:user)
      login_as(user)
      visit "/profiles/#{user.id}"
      expect(page).to have_content("My name is James Brown")
    end
  end

end
