class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
    else
      flash[:error] = "Unable to add friend."
    end
    redirect_to root_url
  end

  def destroy
    @friendship = current_user.friendships.where(user_id: params[:id])
    @friendship.destroy(@friendship.id)
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end
end
