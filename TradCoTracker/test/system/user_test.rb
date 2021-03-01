require "application_system_test_case"

class UserTest < ApplicationSystemTestCase
    test "test bad login" do #rainy day test
        visit login_url
        fill_in "Username", with "test" #Input data email
        fill_in "Password", with "test" #Input data password
        click_on "Sign in"
        assert_selector "h1", text:"sign in" #Expected out come sign in failed
    end

    test "test Sign UP" do #sunny day test
        visit login_url
        click_on "Sign up"
        fill_in "Email", with "test@test.com" #Input data email
        fill_in "Username", with "test1"
        fill_in "Password", with "test" #Input data password
        click_on "Sign in"
        assert_selector "h1", text:"Sign in" #Expected out come account created redirected to sign page
    end