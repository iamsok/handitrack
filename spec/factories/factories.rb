FactoryGirl.define do
  factory :golf_course do
    sequence :name do |n|
     "Los Serranos#{n}"
    end
    course_rating 76.8
    slope_rating 137
  end
end

FactoryGirl.define do
  factory :user do
    sequence :email do |n|
     "blahblah@blah.com#{n}"
    end
    first_name "Bleep"
    last_name "Bloop"
    city "Los Angeles"
    state "CA"
    zip_code 90210
    password 12345678
  end
end
