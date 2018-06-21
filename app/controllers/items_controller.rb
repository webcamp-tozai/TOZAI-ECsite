class ItemsController < ApplicationController
  before_action :set_genre, only: [:index, :show]
  
  def index
    @item = Item.all
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

    if artist = Artist.find_by(name: params[:artist][:name],name_kana: params[:artist][:name_kana])
      # return artist
    else
      artist = Artist.create(name: params[:artist][:name],name_kana: params[:artist][:name_kana])
    end
      @item.artist_id = artist.id

    @item.tracks.each do |t|
      t.artist_id = artist.id
    end
    @item.save
    redirect_to item_path(@item.id)
    flash[:item_created] = "商品を登録しました"
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
    @label = @item.label
    @label_name = Label.all
    @genre = @item.genre
    @genre_name = Genre.all
    @artist = @item.artist
    @artist_name = Artist.all
    @max_disc_number = Track.where(item_id: params[:id]).pluck(:disc_number).max
  end

  def show
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
      @item_review = ItemReview.new
      @cart_item = CartItem.new
      # ディスク枚数の取得
      @max_disc_number = Track.where(item_id: params[:id]).pluck(:disc_number).max
    else
      redirect_to root_path
    end
  end

  def update
    item= Item.find(params[:id])
    item.update(item_params)
   # binding pry

    redirect_to item_path(item.id)
    flash[:item_updated] = "商品情報を更新しました"
  end
def set_search
    @items = Item.all
    @search = Item.ransack(params[:q])
    @items = @search.result.page(params[:page]).reverse_order
  end
  private

  def set_genre
    @genres = Genre.all
  end

  def item_params
    params.require(:item).permit(:item_introduction,
                                 :title,
                                 :image,
                                 :stock,
                                 :price_without_tax,
                                 :content_type,
                                 :is_deleted,
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
