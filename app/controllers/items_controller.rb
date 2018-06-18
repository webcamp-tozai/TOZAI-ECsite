class ItemsController < ApplicationController
  def index
    @genres = Genre.all

    # ransack
    # 検索オブジェクト
    @items = Item.all
    @search = Item.ransack(params[:q])
    # 検索結果
    @items = @search.result.page(params[:page]).reverse_order
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
