class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  validates :user, uniqueness: true
  validates :friend, uniqueness: true

end
