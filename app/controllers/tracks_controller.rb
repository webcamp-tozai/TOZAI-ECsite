class TracksController < ApplicationController
	def create
		# track.save
	end

	def new
	end

	def edit
	end

	def update
	end

	private
	def  track_params
		# params.require(:track).permit(:disk_number,:track_number,:name,:length_hour,:length_minute,:length_second)
	end
end
