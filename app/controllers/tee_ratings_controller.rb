class TeeRatingsController < ApplicationController
  def index
    @tee_ratings = TeeRating.all
  end

  def show
    @tee_rating = TeeRating.find(params[:id])
    @score = Score.new
  end

  def new
    @golf_course = GolfCourse.find(params[:golf_course_id])
    @tee_rating = TeeRating.new
  end

  def create
    binding.pry
      @tee_rating = TeeRating.new(tee_rating_params)
      if @tee_rating.save
        flash[:notice] = 'Score was successfully added!'
        # need to redirect to scores page
        redirect_to golf_course_path(@golf_course)
      else
        flash[:notice] = 'Please fill in required information'
        render :new
      end
  end

  private
  def tee_rating_params
    params.require(:tee_rating).permit(:color, :course_rating, :slope_rating)
  end
end
