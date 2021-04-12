
require 'rails_helper'

RSpec.describe 'users', type: :feature do
  describe 'goes to root path' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Password')
    end

    it 'shows the right content' do
      visit new_user_path
      expect(page).to have_content('Password')
    end

    it 'shows the right content' do
      visit portal_view_members_path
      expect(page).to have_content('Password')
    end
  end
end

# Creating a user
RSpec.describe 'Creating a user with', type: :feature do
  # Sunny day cases for creating a user
  scenario 'valid inputs for a non-officer' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'
    expect(page).to have_content('Log in')
  end

  scenario 'valid inputs for an officer' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'testOfficer@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    check 'user_isOfficer'
    click_on 'Create Account'
    expect(page).to have_content('Log in')
  end

  # Rainy day cases for creating a user
  scenario 'invalid inputs (no email)' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    check 'user_isOfficer'
    click_on 'Create Account'
    expect(page).to have_content('Log in')
  end

  scenario 'invalid inputs (no password)' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'
    # Once the user is created, if there is an error the page will reset.
    expect(page).to have_content('Sign up')
  end

  scenario 'invalid inputs (no password confermation)' do
    visit root_path
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    click_on 'Create Account'
    # Once the user is created, if there is an error the page will reset.
    expect(page).to have_content('Sign up')
  end
end

# loging in
RSpec.describe 'Loging in user', type: :feature do
  # Sunny Day cases
  scenario 'valid login for a non-officer' do
    visit root_path
    # Creating a user for the test to use
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'

    # Actuall test
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'test'
    click_on 'Login'
    expect(page).not_to have_content('View All Points')
    click_on 'Logout'
  end

  scenario 'valid login for a officer' do
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
    expect(page).to have_content('View All Points')
    click_on 'Logout'
  end

  # Rainy day
  scenario 'invalid inputs (no email)' do
    visit root_path
    fill_in 'password', with: 'test'
    click_on 'Login'
    expect(page).to have_content('Log in')
  end

  scenario 'invalid inputs (no password)' do
    visit root_path
    fill_in 'email', with: 'test@gmail.com'
    click_on 'Login'
    expect(page).to have_content('Log in')
  end

  scenario 'invalid input (wrong password)' do
    visit root_path
    # Creating a user for the test to use
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    click_on 'Create Account'

    # Actuall test
    fill_in 'email', with: 'test@gmail.com'
    fill_in 'password', with: 'password'
    click_on 'Login'
    expect(page).not_to have_content('Login')
  end
end

# Viewing users
RSpec.describe 'Viewing users', type: :feature do
  scenario 'with an officer account' do
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
    visit portal_view_members_path
    expect(page).to have_content('Users')
  end
end

# Editing User
# RSpec.describe 'Editinging users', type: :feature do
#   scenario 'with an officer account' do
#     visit root_path
#     # Creating a user for the test to use
#     click_on 'Sign up'
#     fill_in 'user_firstName', with: 'first'
#     fill_in 'user_lastName', with: 'last'
#     fill_in 'user_email', with: 'test@gmail.com'
#     fill_in 'user_password', with: 'test'
#     fill_in 'user_password_confirmation', with: 'test'
#     check 'user_isOfficer'
#     click_on 'Create Account'

#     # Actual test
#     fill_in 'email', with: 'test@gmail.com'
#     fill_in 'password', with: 'test'
#     click_on 'Login'
#     visit portal_view_members_path
#     click_on 'Edit'
#     expect(page).to have_content('Edit User')
#   end
# end




# Deleting user
RSpec.describe 'Deletinging users', type: :feature do
  scenario 'with an officer account' do
    visit root_path
    # Creating a user for the test to use
    click_on 'Sign up'
    fill_in 'user_firstName', with: 'first'
    fill_in 'user_lastName', with: 'last'
    fill_in 'user_email', with: 'test14@gmail.com'
    fill_in 'user_password', with: 'test'
    fill_in 'user_password_confirmation', with: 'test'
    check 'user_isOfficer'
    click_on 'Create Account'

    # Actual test
    fill_in 'email', with: 'test14@gmail.com'
    fill_in 'password', with: 'test'
    click_on 'Login'
    visit portal_view_members_path
    first(:link, "Delete").click
    expect(page).not_to have_content('Deleted')
  end
end
