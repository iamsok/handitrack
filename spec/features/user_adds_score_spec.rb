require 'rails_helper'

feature 'user adds a score' do

  scenario  'user enters course name, slope rating, course rating and location' do
    golf_course = FactoryGirl.build(:golf_course)
    visit new_golf_course_path
    fill_in "Name", with: golf_course.name
    fill_in "Course rating", with: golf_course.course_rating
    fill_in "Slope rating", with: golf_course.slope_rating
    click_on "Add New Golf Course"
    expect(page).to have_content("Golf Course was successfully added!")
  end
