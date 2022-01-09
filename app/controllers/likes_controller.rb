class LikesController < ApplicationController
  before_action :set_post
  before_action :set_like, only: %i[ destroy ]

  def create
    @like = @post.likes.create(user_id: current_user.id)

    redirect_to post_path(@post)
  end

  def destroy
    @like.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
