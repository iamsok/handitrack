class GolfCourse < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :tee_ratings
end
