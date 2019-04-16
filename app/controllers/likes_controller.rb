# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_artist
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @artist.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if !already_liked?
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def find_like
    @like = @artist.likes.find(params[:id])
  end

  def find_artist
    @artist = Artist.find(params[:artist_id])
  end

  def already_liked?
    Like.where(user_id: current_user.id, artist_id:
    params[:artist_id]).exists?
  end
end
