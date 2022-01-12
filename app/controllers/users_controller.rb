class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
    @friend_requests = current_user.incoming_friend_requests
    @friend_suggestions = current_user.suggested_friends
  end

  def index
    @users = User.where('id != ?', current_user.id)
    @friend_requests = current_user.incoming_friend_requests
  end
end
