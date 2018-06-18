class ItemsController < ApplicationController
  def index
    @genres = Genre.all
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
    else
      redirect_to root_path
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:item_introduction, :title, :image_id, :stock, :price_without_tax, :content_type)
  end

end
