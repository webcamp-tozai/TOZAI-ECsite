class LabelsController < ApplicationController
	def create
	end

	def index
		@items = @items.select(:label_id).distinct.page(params[:page]).reverse_order.per(PER_ITEM)
	end

	def new
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
