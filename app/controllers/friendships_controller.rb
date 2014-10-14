class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added Friend"
      redirect_to root_path
    else
      flash[:error] = "Unable to add friend"
      redirect_to root_path
    end
  end

  def destroy
    @friendship = current_user.friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed Friend"
    redirect_to current_user
  end
end
