class OrdersController < ApplicationController
	def index
		@order = current_user.orders.all
		@order_item = OrderItem.where(order_id: @order)
	end

	def create
    order = Order.new(order_params)
    order.save
  	redirect_to orders_path
	end

	def new
		@order = Order.new
		@order.order_items.build
		@cart_items = current_user.cart_items.all
		@address = Address.where(user_id: current_user.id)
	end

	def edit
	end

	def show
	end

	def update
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :address_id, :payment_id, :status, :total_count, :total_price_without_tax, :total_price, order_items_attributes: [:order_id, :item_id, :item_count, :total_price_without_tax])
	end
end
