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
    @tee_rating = TeeRating.find_or_create_by(tee_rating_params.merge(golf_course: @golf_course))

    if @score.save
      flash[:notice] = 'Score was successfully submitted!'
      # need to redirect to users profile page
      redirect_to score_path(@score)
    else
      flash[:notice] = 'Please fill in required information'
      render :new
    end
  end

  private
  def score_params
    params.require(:score).permit(:score, :date).merge(user: current_user)
  end

  def golf_course_params
    params[:score].require(:golf_course).permit(:name, :location)
  end

  def tee_rating_params
    params[:score].require(:tee_rating).permit(:color, :course_rating, :slope_rating)
  end
end
