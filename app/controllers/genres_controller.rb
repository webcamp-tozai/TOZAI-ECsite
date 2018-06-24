class GenresController < ApplicationController
	def create
	end

	def index
		@genre = Genre.all
	end

	def new
	end

	def edit
		@genre = Genre.find(params[:id])
	end

	def update
		@genre = Genre.find(params[:id])
		@genre.update(genre_params)
		redirect_to genres_path

	end

	private
	def genre_params
		params.require(:genre).permit(:id,:genre_english,:genre_kana)
	end

end
