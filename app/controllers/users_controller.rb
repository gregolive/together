class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.where('id != ?', current_user.id)
    @friend_requests = current_user.incoming_friend_requests
  end
end
