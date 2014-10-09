FactoryGirl.define do
  factory :golf_course do
    sequence :name do |n|
     "Los Serranos#{n}"
    end
    location "Chino Hills"
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

FactoryGirl.define do
  factory :score do
    score 74
    date "11/12/13"
    association :user
    association :tee_rating
  end
end

FactoryGirl.define do
  factory :tee_rating do
    color "Blue"
    slope_rating 71.2
    course_rating 130
    association :golf_course
  end
end
