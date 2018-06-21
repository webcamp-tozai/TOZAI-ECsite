class ArtistsController < ApplicationController
	def create
	end

	def new
	end

	def edit
		
	end

	def update
	end

	private
	 params.require(:artist).permit(:name,
	 															:name_kana,
	 															:item_id,
	 															tracks_attributes: [:disc_number,
                                                      :track_number,
                                                      :name,
                                                      :length_hour,
                                                      :length_minute,
                                                      :length_second,
                                                      :artist_id
                                                    ]
                                )
end
