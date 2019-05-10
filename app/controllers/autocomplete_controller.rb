# frozen_string_literal: true

class AutocompleteController < ApplicationController
  def index
    case params[:what]
      when 'artists' then
      respond_to do |format|
        format.json { render json: { data: Artist.search_by_name(params[:term]).limit(5) } }
      end
      when 'genres' then
      respond_to do |format|
        format.json { render json: { data: Genre.search_by_name(params[:term]).limit(5) } }
      end
    end
  end
end
