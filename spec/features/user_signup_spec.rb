require 'rails_helper'

RSpec.feature 'UserSignups', type: :feature do
  before(:each) do
    100.times do
      create(:user)
    end

    it 'shows login button' do
      visit login_path
      expect(page).to have_content('Login')
    end

    it 'allows a user to register with a name' do
      visit new_user_path
      fill_in 'Name', with: 'Ismael'
      fill_in 'example@me.com', with: 'ismael@net.com'
      fill_in 'password', with: '123456'
      fill_in 'password_confirmation', with: '123456'
      click_on 'Create User'
      expect(page).to have_content('Ismael')
    end
  end
end
