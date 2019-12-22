# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :authenticate_user!, only: :rating
  def index
    @categories = Category.all
    @movies = (
      params[:category_id] ? Movie.where(category_id: params[:category_id]) : Movie
    ).page(params[:page])
  end

  def show
    movie
  end

  def rating
    movie.ratings.create(score: params[:rating], user: current_user)
    redirect_back fallback_location: root_path
  end

  private

  def movie
    @movie ||= Movie.friendly.find(params[:id])
  end
end
