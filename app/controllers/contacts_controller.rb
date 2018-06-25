class ContactsController < ApplicationController
	def index
	end

	def create
	end

	def new
	end

	def show
	end
	
	def update
	end

	private
	def contact_params
		params.require(:contact).permit(:contact_status_id,:name,:title,:email,:message)
	end
end
