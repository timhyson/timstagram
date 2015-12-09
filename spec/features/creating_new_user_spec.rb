require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'User Name', with: 'railsdev'
    fill_in 'Email', with: 'railsdev@myspace.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Confirm Password', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
