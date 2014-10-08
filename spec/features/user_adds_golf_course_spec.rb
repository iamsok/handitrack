require 'rails_helper'

feature 'user adds a golf course' do

  scenario  'user enters course name, slope rating, course rating and location' do
    golf_course = FactoryGirl.build(:golf_course)
    visit new_golf_course_path
    fill_in "Name", with: golf_course.name
    fill_in "Location", with: golf_course.location
    fill_in "Course rating", with: golf_course.course_rating
    fill_in "Slope rating", with: golf_course.slope_rating
    click_on "Add New Golf Course"
    expect(page).to have_content("Golf Course was successfully added!")
  end

  scenario 'user cannot submit the same golf course' do
    golf_course = FactoryGirl.create(:golf_course)
    visit new_golf_course_path
    fill_in "Name", with: golf_course.name
    fill_in "Location", with: golf_course.location
    fill_in "Course rating", with: golf_course.course_rating
    fill_in "Slope rating", with: golf_course.slope_rating
    click_on "Add New Golf Course"
    expect(page).to have_content("Golf course already exists")
  end

  scenario 'user tries to create a golf course with a blank field' do
    manufacturer = FactoryGirl.create(:golf_course)
    visit new_golf_course_path
    click_on "Add New Golf Course"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page).to have_content("Course rating can't be blank")
    expect(page).to have_content("Slope rating can't be blank")
  end
end
