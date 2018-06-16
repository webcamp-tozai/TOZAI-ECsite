class ItemsController < ApplicationController
  def index
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:item_introduction,:title,:image,:stock,:price_without_tax,:content_type)
  end

end
