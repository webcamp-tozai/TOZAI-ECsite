class AddressesController < ApplicationController
	def index
	end

	def create
	end

	def new
	end

	def update
	end

	def destroy
	end

	private
	def address_params
		params.require(:address).permit(:user_id,:post_code,:address,:name)
	end
end
