class GenresController < ApplicationController
	before_action :authenticate_admin, except: [:show]

	PER_ITEM = 12

	def create
	end

	def index
		@items = @items.select(:genre_id).distinct.page(params[:page]).reverse_order.per(PER_ITEM)
	end

  def show
  	@items = Item.where(genre_id: params[:id]).page(params[:page]).reverse_order.per(PER_ITEM)
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

	def destroy
		@genre = Genre.find(params[:id])
		@genre.destroy
		redirect_to genres_path
	end

	private
	def genre_params
		params.require(:genre).permit(:id,:genre_english,:genre_kana)
	end

end
