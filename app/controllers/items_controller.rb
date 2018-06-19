class ItemsController < ApplicationController
  before_action :set_genre, only: [:index, :show]
  
  def index
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
    if Item.exists?(params[:id])
      @item = Item.find(params[:id])
      @item_review = ItemReview.new
      
      # ディスク枚数の取得
      @max_disc_number = Track.where(item_id: params[:id]).pluck(:disc_number).max
    else
      redirect_to root_path
    end
  end

  def update
  end

  private
  
  def set_genre
    @genres = Genre.all
  end

  def item_params
    params.require(:item).permit(:item_introduction, :title, :image_id, :stock, :price_without_tax, :content_type)
  end

end
