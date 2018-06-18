class ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).reverse_order
    
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
      @cart_item = CartItem.new
      @add_cart_item = CartItem.new
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:item_introduction, :title, :image_id, :stock, :price_without_tax, :content_type, :id)
  end

end
