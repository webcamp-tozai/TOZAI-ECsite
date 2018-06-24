class ArtistsController < ApplicationController
	PER_ITEM = 12

	def create
	end

	def new
	end

	def show
		@items = Item.where(artist_id: params[:id]).page(params[:page]).reverse_order.per(PER_ITEM)
    render 'items/index'
	end

	def edit
	end

	def update
	end
end
