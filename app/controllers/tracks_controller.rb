class TracksController < ApplicationController
	def create
	end

	def new
	end

	def edit
	end

	def update
	end

	def destroy
		#binding.pry
    @item = Item.find(params[:item_id])
    @tracks = Track.find_by(item_id: params[:item_id],id: params[:id])
    @tracks.destroy
    redirect_to edit_item_path(@item.id)
  end

  private
  def track_params
  	params.require(:track).permit(:disc_number,
                                  :track_number,
                                  :name,
                                  :length_hour,
                                  :length_minute,
                                  :length_second,
                                  :item_id)
  end
end
