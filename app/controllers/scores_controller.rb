class ScoresController < ApplicationController
  before_filter :authenticate_user!

  def index
    @scores = Score.all
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
    @golf_course = GolfCourse.new
    @tee_rating = TeeRating.new
  end

  def create
    @score = Score.new(score_params)
    @golf_course = GolfCourse.find_or_create_by(golf_course_params)
    new_params = tee_rating_params
      new_params[:golf_course_id] = @golf_course.id
    @tee_rating = TeeRating.find_or_create_by(new_params)
    @tee_rating.golf_course = @golf_course
    @score.user = current_user
      if @score.save
        flash[:notice] = 'Score was successfully submitted!'
        # need to redirect to scores page
        redirect_to score_path(@score)
      else
        flash[:notice] = 'Please fill in required information'
        render :new
      end
  end

  private
  def score_params
    params.require(:score).permit(:score, :date)
  end

  def golf_course_params
    params[:score].require(:golf_course).permit(:name, :location)
  end

  def tee_rating_params
    params[:score].require(:tee_rating).permit(:color, :course_rating, :slope_rating)
  end
end
