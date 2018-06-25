class LabelsController < ApplicationController
	before_action :authenticate_admin

	def create
	end

	def index
		@items = @items.select(:label_id).distinct.page(params[:page]).reverse_order
	end

	def show
		redirect_to root_path
	end

	def edit
		@label = Label.find(params[:id])
	end

	def update
		@label = Label.find(params[:id])
		@label.update(label_params)
		redirect_to labels_path
	end

	private

	def label_params
		params.require(:label).permit(:id,:name)
	end

end
