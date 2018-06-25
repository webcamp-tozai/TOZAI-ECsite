class ArtistsController < ApplicationController
	before_action :authenticate_admin, except: [:show]

	PER_ITEM = 12

	def index
		@items = @items.select(:artist_id).distinct.page(params[:page]).reverse_order.per(PER_ITEM)
	end

	def create
	end

	def new
	end

	def show
		@items = Item.where(artist_id: params[:id]).page(params[:page]).reverse_order.per(PER_ITEM)
    render 'items/index'
	end

	def edit
		@artist = Artist.find(params[:id])
	end

	def update
		@artist = Artist.find(params[:id])
		@artist.update(artist_params)
		redirect_to artists_path
	end

	private

	def artist_params
		params.require(:artist).permit(:id,:name,:name_kana)
	end

end
