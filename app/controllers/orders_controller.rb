class OrdersController < ApplicationController
	def index
	end

	def create
	end

	def new
	end

	def edit
	end

	def show
	end

	def update
	end

	private
	def order_params
		params.require(:order).permit(:product_id,:user_id,:address_id,:payment_id,:status,:total_count,:total_price_without_tax,:total_price)
	end
end
