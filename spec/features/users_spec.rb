require 'rails_helper'

describe "Users Features", js: true do
  describe "sign up a new user" do
    it "signs me up" do
      visit "/#/users/sign_up"
      within '#signUpForm' do
        fill_in "Username", with: "foobar"
        fill_in "Password", with: "passw0rd"
        fill_in "Email", with: "foobar@example.com"
        fill_in "First Name", with: "John"
        fill_in "Last Name", with: "Doe"
      end
      click_button 'Sign Up'
      expect(page).to have_content 'You have successfully signed up'
    end
  end

  describe "sign in a user" do
    let(:user) { create(:user) }

    it "signs me in" do
      visit "/#/users/sign_in"
      within '#signInForm' do
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
      end
      click_button 'Sign In'
      expect(page).to have_content 'Projects'
    end
  end
end
