class LikesController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[ create ]
  before_action :set_like, only: %i[ destroy ]

  def create
    if @comment.nil?
      @like = @post.likes.create(user_id: current_user.id)
    else
      @like = @comment.likes.create(user_id: current_user.id)
    end

    respond_to do |format|
      if @like.save
        format.html { redirect_to post_path(@post) }
        format.json { render :show, status: :created, location: @like }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
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

  def set_comment
    @comment = Comment.find(params[:comment_id]) unless params[:comment_id].blank?
  end

  def set_like
    @like = Like.find(params[:id])
  end
end
