class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    result = comment_params
    comment = Comment.create(result)
    redirect_to(artist_path(params[:artist_id]))
    #redirect_back(fallback_location: root_path)
  end

  def edit
    unless @current_user
      redirect_to(root_path)
    end
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to(artist_path(params[:artist_id]))
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to(artist_path(params[:artist_id]))
  end

  private

  def comment_params
    result = params.require(:comment).permit(:content)
    result[:user_id] = current_user.id
    result[:artist_id] = params[:artist_id]
    puts result
    return result
  end
end
