class MoviesController < ApplicationController
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
