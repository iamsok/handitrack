class GolfCoursesController < ApplicationController
  def index
    @golf_courses = GolfCourse.all
  end

  def show
    @golf_course = GolfCourse.find(params[:id])
    @score = Score.new
  end

  def new
    @golf_course = GolfCourse.new
  end

  def create
    @golf_course = GolfCourse.new(golf_course_params)
      if @golf_course.save
        flash[:notice] = 'Golf Course was successfully added!'
        # need to redirect to scores page
        redirect_to golf_course_path(@golf_course)
      else
        flash[:notice] = 'Please fill in required information'
        render :new
      end
  end

  private
  def golf_course_params
    params.require(:golf_course).permit(:name, :location, :course_rating, :slope_rating)
  end
end
