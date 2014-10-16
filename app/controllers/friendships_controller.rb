class FriendshipsController < ApplicationController
  def index
    @friendship = Friendship.all
  end

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:user_id])
    if @friendship.save
      flash[:notice] = "Added Friend"
      redirect_to users_path
    else
      flash[:error] = "Unable to add friend"
      redirect_to users_path
    end
  end

  def destroy
    @friendship = current_user.friendships.find_by(user_id: params[:user_id])
    @friendship.destroy
    flash[:notice] = "Removed Friend"
    redirect_to current_user
  end
end
