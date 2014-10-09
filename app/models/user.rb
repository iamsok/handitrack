class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  has_many :scores

  def name
    first_name.capitalize + " " + last_name.capitalize
  end

  def differential
    differential = []
    recent_scores = scores.sort_by { |x| x.date }.reverse
    recent_scores.each do |score|
      differential << (score.score - score.course_rating) * 113 / score.slope_rating
    end
    differential.first(20).sort
  end

  def handicap
    array = differential
    array.inject{|sum,x| sum + x }
    (array / array.length) * 0.96
  end
end
