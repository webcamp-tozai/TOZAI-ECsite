class ItemsController < ApplicationController
  def index
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)

    if label = Label.find_by(name: params[:label][:name])
      # return label
    else
      label = Label.create(name: params[:label][:name])
    end
      @item.label_id = label.id
      # binding pry
    if genre = Genre.find_by(genre_english: params[:genre][:genre_english],genre_kana: params[:genre][:genre_kana])
      # return genre
    else
      genre = Genre.create(genre_english: params[:genre][:genre_english],genre_kana: params[:genre][:genre_kana])
    end
    @item.genre_id = genre.id

    if artist = Artist.find_by(name: params[:artist][:name])
      # return artist
    else
      artist = Artist.create(name: params[:artist][:name],name_kana: params[:artist][:name_kana])
    end
      @item.artist_id = artist.id

    @item.tracks.each do |t|
      t.artist_id = artist.id
    end
    binding pry
    @item.save
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.tracks.build
    @label_name = Label.all
    @label = Label.new
    @genre_name = Genre.all
    @genre = Genre.new
    @artist_name = Artist.all
    @artist = Artist.new
  end

  def edit
    @item = Item.find(params[:id])
    @track = Track.find(params[:id])
  end

  def show
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
      @item_review = ItemReview.new
    else
      redirect_to root_path
    end
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
