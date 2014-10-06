FactoryGirl.define do
  factory :golf_course do
    sequence :name do |n|
     "Los Serranos#{n}"
    end
    course_rating 76.8
    slope_rating 137
  end
end
