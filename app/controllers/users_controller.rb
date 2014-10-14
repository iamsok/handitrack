class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @scores = @user.scores
  end

  def index
    if params[:search]
      @users = User.search(params[:search])
    else
      @users = User.all
    end
  end
end
