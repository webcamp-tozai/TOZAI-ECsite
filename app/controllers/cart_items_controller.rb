class CartItemsController < ApplicationController
  def create
  end

  def new
  end

  def update
  end

  def destroy
  end

  private

  def cart_item_params
	params.require(:cart_item).permit(:item_id, :user_id, :item_count)
  end
end
