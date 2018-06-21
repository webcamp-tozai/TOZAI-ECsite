class OrderItemsController < ApplicationController
	def index
	end

	def create
		order_item = OrderItem.new(oreder_item_params)
		order_item.save
    redirect_to orders_path
	end

	private
	def order_item_params
		params.require(:order_item).permit(:id, :order_id, :item_id, :item_count, :total_price_without_tax)
	end
end
