class User < ActiveRecord::Base
  mount_uploader :profile_photo, ProfilePhotoUploader
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
    recent_scores = scores.order(date: :desc)
    recent_scores.each do |score|
      differential << (((score.score - score.tee_rating.course_rating) * 113) / score.tee_rating.slope_rating)
    end
    differential.first(20).sort
  end

  def handicap
    differentials = differential
    if differentials.count < 16
      divisors = (differentials.count - 3) / 2
    else
      divisors = differentials.count - 10
    end
    sum = differentials.first(divisors).inject{ |sum, x| sum + x }
    ((sum / divisors) * 0.96).round(1)
  end
end
