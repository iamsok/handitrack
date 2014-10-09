class Score < ActiveRecord::Base
  validates :score, presence: true
  validates :date, presence: true
  validates :user, presence: true
  belongs_to :tee_rating
  belongs_to :user
end
