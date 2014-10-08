class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end

  def show
    @score = Score.find(params[:id])
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    @golf_course = GolfCourse.find(params[:golf_course_id])
      @score.golf_course = @golf_course
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
end
