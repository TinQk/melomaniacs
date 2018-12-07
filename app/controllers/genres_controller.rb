class GenresController < ApplicationController
  before_action :authenticate_user!

  def show
    @genre = Genre.find(params[:id])
  end
end
