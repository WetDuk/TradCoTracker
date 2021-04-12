
require 'rails_helper'

# Creating points
RSpec.describe 'Creating points', type: :feature do
  scenario 'with valid inputs' do
    visit root_path
    # Creating a user for the test to use
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    check 'user_isOfficer'
    click_on 'Create Account'

    # Actual test
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'test'
    click_on 'Login'
    visit new_point_path
    fill_in 'point_eventName', with: 'test event'
    fill_in 'point_pointAmount', with: '3'
    fill_in 'point_submissionDate', with: '03/23/2021'
    click_on 'Add Points'
    expect(page).to have_content('test event')
  end
end

# deleting points
RSpec.describe 'Deleting points', type: :feature do
  scenario 'with valid inputs' do
    visit root_path
    # Creating a user for the test to use
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    check 'user_isOfficer'
    click_on 'Create Account'

    # Actual test
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'test'
    click_on 'Login'
    visit new_point_path
    fill_in 'point_eventName', with: 'test event'
    fill_in 'point_pointAmount', with: '3'
    fill_in 'point_submissionDate', with: '03/23/2021'
    click_on 'Add Points'
    expect(page).to have_content('test event')
    click_on 'Delete'
    expect(page).not_to have_content('test event')
  end
end