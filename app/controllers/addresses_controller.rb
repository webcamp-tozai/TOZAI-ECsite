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
	def addresses_params
		params.require(:addresses).permit(:user_id,:post_code,:address,:name)
	end
end