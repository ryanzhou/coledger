require 'rails_helper'

describe "Users Features", js: true do
  describe "sign up a new user" do
    it "signs me up" do
      visit "/#/users/sign_up"
      within '#signUpForm' do
        fill_in "Username", with: Faker::Internet.user_name
        fill_in "Password", with: Faker::Internet.password
        fill_in "Email", with: Faker::Internet.free_email
        fill_in "First Name", with: Faker::Name.first_name
        fill_in "Last Name", with: Faker::Name.last_name
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
