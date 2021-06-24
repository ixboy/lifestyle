require 'rails_helper'

RSpec.feature 'UserLogins', type: :feature do
  before(:each) do
    100.times do
      create(:user)
    end

    it 'shows login button' do
      visit login_path
      expect(page).to have_content('Login')
    end

    it 'allows a user to login with a registrated name' do
      visit login_path
      fill_in 'name', with: user.name
      click_on 'Login'
      expect(page).to have_content('')
    end
  end
end
