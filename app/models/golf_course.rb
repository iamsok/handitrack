class GolfCourse < ActiveRecord::Base
  validates :name, presence: true
  validates :location, presence: true
  has_many :tee_ratings
  has_many :scores, through: :tee_ratings


  def self.search(location)
    golf_courses_info = []
    golf_courses = Yelp.client.search(location, { category_filter: 'golf', sort: 2, limit: 20, term: 'golf' })
    golf_courses = golf_courses.as_json
    golf_courses["hash"]["businesses"].each do |business|
      golf_courses_info << { name: business["name"], location: business["location"]["display_address"], phone: business["display_phone"], rating: business["rating"] }
      # GolfCourse.search(name: business["name"], location: business["location"]["display_address"].to_s)
    end
    golf_courses_info
  end
end
