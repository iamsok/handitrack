class Score < ActiveRecord::Base
  validates :score, presence: true
  validates :date, presence: true
  belongs_to :user
  belongs_to :golf_course
end
