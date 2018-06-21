class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: %w(show edit update destroy)

  def index
    @user = User.find(current_user.id)
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
    if item.stock - cart_item.item_count >= 0
      cart_item.save
      flash[:cart_item_created] = "カートに商品を追加しました"
      redirect_to user_cart_items_path(current_user)
    else
      redirect_to item_path(item)
      flash[:cart_item_create_faled] = "入力した数量が在庫数を上回っています。残りの在庫数は#{item.stock}個です。"
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to user_cart_items_path(cart_item)
    flash[:cart_item_updated] = "変更を保存しました"
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to user_cart_items_path(cart_item.user_id)
    flash[:cart_item_destroyed] = "カートから商品を削除しました"
  end

  def all_destroy
    cart_item = current_user.cart_items.all
    cart_item.destroy_all
    redirect_to user_cart_items_path(current_user)
    flash[:cart_item_all_destroyed] = "カートを空にしました"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :user_id, :item_count)
  end

  def set_cart_item
    @cart_item = CartItem.find(params[:id])
  end

end
