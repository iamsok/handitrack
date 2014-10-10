class TeeRating< ActiveRecord::Base
  validates :golf_course,
    uniqueness: { scope: :color }
  validates :course_rating, presence: true
  validates :slope_rating, presence: true
  validates :color, presence: true

  has_many :scores
  belongs_to :golf_course

  accepts_nested_attributes_for :golf_course

  def self.colors
    ["Red", "White", "Blue"]
  end
end
