class GolfCourse < ActiveRecord::Base
  validates :name, presence: true,
    uniqueness: {message: "Golf course already exists"}
  validates :course_rating, presence: true
  validates :slope_rating, presence: true
end
