class GenresController < ApplicationController
	before_action :set_genres, only: [:index, :show]
	
	PER_ITEM = 12
	
	def create
	end

	def index
	end
  
  def show
  	@items = Item.where(genre_id: params[:id]).page(params[:page]).reverse_order.per(12)
  	render 'items/index'
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
	
	def set_genres
		@genres = Genre.all
	end

	private
	def genre_params
		params.require(:genre).permit(:id,:genre_english,:genre_kana)
	end

end
