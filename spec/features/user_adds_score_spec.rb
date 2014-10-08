require 'rails_helper'

feature 'user adds a score' do

  scenario  'user creates or selects a golf course and enters a score' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    course = FactoryGirl.create(:golf_course)
    score = FactoryGirl.build(:score)
    visit golf_course_path(course)
    fill_in "Score", with: score.score
    fill_in "Date", with: score.date
    save_and_open_page
    click_on "Add Score"
    expect(page).to have_content("Score was successfully submitted!")
  end
end