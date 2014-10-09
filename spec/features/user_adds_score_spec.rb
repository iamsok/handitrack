require 'rails_helper'

feature 'user adds a score' do

  scenario  'with all required attributes and new golf course and tee rating', focus: true do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link "Sign In"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    golf_course = FactoryGirl.build(:golf_course)
    tee_rating = FactoryGirl.build(:tee_rating)
    score = FactoryGirl.build(:score)

    visit new_score_path
    fill_in "Name", with: golf_course.name
    fill_in "Location", with: golf_course.location
    select tee_rating.color, from: "Color"
    fill_in "Course rating", with: tee_rating.course_rating
    fill_in "Slope rating", with: tee_rating.slope_rating
    fill_in "Score", with: score.score
    fill_in "Date", with: score.date
    click_on "Add Score"
    expect(page).to have_content("Score was successfully submitted!")
  end

  scenario 'with all required attributes and existing golf course and tee rating' do
    user = FactoryGirl.build(:user)
    golf_course = FactoryGirl.build(:golf_course)
    tee_rating = FactoryGirl.build(:tee_rating)
    visit root_path
    click_link "Sign In"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"

    course = FactoryGirl.build(:golf_course)
    tee_rating = FactoryGirl.build(:tee_rating)
    score = FactoryGirl.build(:score)

    visit new_score_path
    fill_in "Name", with: golf_course.name
    fill_in "Location", with: golf_course.location
    fill_in "Tee color", with: tee_rating.color
    fill_in "Course rating", with: tee_rating.course_rating
    fill_in "Slope rating", with: tee_rating.slope_rating
    fill_in "Score", with: score.score
    fill_in "Date", with: score.date
    click_on "Add Score"
    expect(page).to have_content("Score was successfully submitted!")
  end

  scenario  'user doesnt input all neccessary field' do
    user = FactoryGirl.create(:user)
    golf_course = FactoryGirl.create(:golf_course)
    tee_rating = FactoryGirl.create(:tee_rating)
    visit root_path
    click_link "Sign In"
    fill_in "Email",    with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    course = FactoryGirl.create(:golf_course)
    score = FactoryGirl.build(:score)
    visit new_score_path
    click_on "Add Score"
    expect(page).to have_content("Score can't be blank")
    expect(page).to have_content("Date can't be blank")
  end
end

