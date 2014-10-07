require 'rails_helper'

feature 'user signs up' do

  scenario  'user enters all required field' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: user.email
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "City", with: user.city
    fill_in "State", with: user.state
    fill_in "Zip code", with: user.password
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password
    click_on "Register"
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

    scenario  'user does not include all required field' do
    user = FactoryGirl.build(:user)
    visit root_path
    click_on "Sign up"
    click_on "Register"
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Zip code can't be blank")
  end

    scenario 'user signs out' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    click_on "Sign out"
    expect(page).to have_content( "Signed out successfully.")
  end


    scenario 'user signs in with correct credentials' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Log in"
    expect(page).to have_content("Signed in successfully.")
  end
end
