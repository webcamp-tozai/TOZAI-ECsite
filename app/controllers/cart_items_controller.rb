class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %w(show edit update destroy)

  def index
    @user = User.find(params[:user_id])
    @cart_item = current_user.cart_items.all
    if params[:id].present?
      set_cart_item
    else
      @cart_item = CartItem.new
    end
  end

  def create
    item = Item.find(params[:item_id])
    cart_item = item.cart_items.new(cart_item_params)
    cart_item.user_id = current_user.id
    if item.stock - cart_item.item_count >= 0 || item.is_deleted == true
      #cart_item = CartItem.find_or_initialize_by(item_id: item.id, user_id: current_user.id)
      if cart_item.new_record?
        cart_item.save
      #else
        #cart_item.update_attributes(item_count: cart_item.item_count)
      end
      redirect_to user_cart_items_path(cart_item.user_id)
    else
      redirect_to item_path(item)
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to user_cart_items_path(cart_item)
    flash[:updated] = "変更を保存しました"
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to user_cart_items_path(cart_item.user_id)
    flash[:destroyed] = "カートから商品を削除しました"
  end

  def all_destroy
    cart_item = current_user.cart_items.all
    cart_item.destroy_all
    redirect_to user_cart_items_path(current_user)
    flash[:destroyed] = "カートから商品を削除しました"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :user_id, :item_count, :id)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
