require 'rails_helper'

feature 'view users profile page' do

  scenario  'user visits profile page and sees list of all golf course, score, date' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit user_path(user)
  end
end

