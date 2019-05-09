# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    result = comment_params
    Comment.create(result)
    redirect_to(artist_path(params[:artist_id]))
  end

  def edit
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
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    result = params.require(:comment).permit(:content)
    result[:user_id] = current_user.id
    result[:artist_id] = params[:artist_id]
    result
  end
end
