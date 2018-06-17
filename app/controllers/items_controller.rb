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
end
