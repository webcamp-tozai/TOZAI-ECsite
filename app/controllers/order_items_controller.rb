class OrderItemsController < ApplicationController
	def index
	end

	def create
	end

	private
	def order_item_params
		params.require(:order_item).permit(:item_id,:item_count,:total_price_without_tax)
	end
end
