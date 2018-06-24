class LabelsController < ApplicationController
	def create
	end

	def index
		@label = Label.all
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
