class Score < ActiveRecord::Base
  validates :score, presence: true
  validates :date, presence: true
  validates :user, presence: true
  validates :tee_rating, presence: true

  belongs_to :tee_rating
  belongs_to :user

  accepts_nested_attributes_for :tee_rating
end
