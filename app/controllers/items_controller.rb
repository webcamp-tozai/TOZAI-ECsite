class ItemsController < ApplicationController
  def index
  end

  def create
    @item = Item.new(item_params)

    label = Label.create(name: params[:item][:label][:name])
    @item.label_id = label.id
    genre = Genre.create(genre_english: params[:item][:genre][:genre_english],genre_kana: params[:item][:genre][:genre_kana])
    @item.genre_id = genre.id
    artist = Artist.create(name: params[:artist][:name],name_kana: params[:artist][:name_kana])
    @item.artist_id = artist.id

    @item.tracks.each do |t|
      t.artist_id = artist.id
    end
    #binding pry
    @item.save
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.tracks.build
    @label = Label.new
    @genre = Genre.new
    @artist = Artist.new
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:item_introduction,
                                 :title,
                                 :image,
                                 :stock,
                                 :price_without_tax,
                                 :content_type,
                                  tracks_attributes: [:disc_number,
                                                      :track_number,
                                                      :name,
                                                      :length_hour,
                                                      :length_minute,
                                                      :length_second
                                                    ]
                                )
  end

end
