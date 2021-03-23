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
