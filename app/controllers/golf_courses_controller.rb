class GolfCoursesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @golf_courses = GolfCourse.search(params[:golf_course_search]) if params[:golf_course_search]
    # GolfCourse.search(params[:golf_course_search]) if params[:golf_course_search]
  end
end
