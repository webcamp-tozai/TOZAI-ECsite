class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: %w(show edit update destroy)

  def index
    @user = User.find(current_user.id)
    @cart_item = current_user.cart_items
    @cart_item.each do |cart_item|
      item = Item.find(cart_item.item_id)
      # 在庫がゼロになった時の検証用
      # item.stock = 0
      # 販売終了になった時の検証用
      # item.is_deleted = true
      if item.stock == 0
        cart_item.destroy
        redirect_to user_cart_items_path(current_user)
        flash[:cart_item_force_destroyed] = "#{item.title}は在庫切れになったため、カートから削除しました。"
        return
      elsif item.is_deleted == true
        cart_item.destroy
        redirect_to user_cart_items_path(current_user)
        flash[:item_is_deleted] = "#{item.title}は販売終了となったため、カートから削除しました。"
        return
      elsif item.stock - cart_item.item_count < 0
        difference_negative = item.stock - cart_item.item_count
        difference = 0 - difference_negative
        item_count = cart_item.item_count - difference
        cart_item.update(item_count: item_count)
        redirect_to user_cart_items_path(current_user)
        flash[:cart_item_warning] = "#{item.title}の数量が在庫数を上回っています。こちらの商品は最大で#{cart_item.item_count}個購入できます。"
        flash[:cart_item_updated] = "#{item.title}の数量を#{cart_item.item_count}個に変更しました"
        return
      end
    end
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
    if cart_items = CartItem.find_by(item_id: item.id, user_id: current_user.id)
      count_sum = cart_items.item_count + params[:cart_item][:item_count].to_i
      if item.id == params[:item_id].to_i && item.stock - count_sum >= 0
        cart_items.update_attributes(item_count: count_sum)
        redirect_to user_cart_items_path(current_user)
        flash[:cart_item_updated] = "#{item.title}の数量を#{cart_items.item_count}個に変更しました。"
      elsif item.stock - params[:cart_item][:item_count].to_i < 0
        redirect_to item_path(item)
        flash[:cart_item_create_faled] = "入力した数量が在庫数を上回っています。こちらの商品は最大で#{cart_items.item_count}個購入できます。"
      elsif item.stock - count_sum < 0
        redirect_to user_cart_items_path(current_user)
        flash[:cart_item_update_faled] = "#{item.title}の合計数量が在庫数を上回っています。こちらの商品は最大で#{cart_items.item_count}個購入できます。"
      end
    elsif item.stock - params[:cart_item][:item_count].to_i >= 0
      cart_item.save
      redirect_to user_cart_items_path(current_user)
      flash[:cart_item_created]  = "#{item.title}を#{cart_item.item_count}個カートに追加しました。"
    end
  end


  def update
    cart_item = CartItem.find(params[:id])
    item = Item.find(cart_item.item_id)
    cart_item.update(cart_item_params)
    redirect_to user_cart_items_path(cart_item)
    flash[:cart_item_updated] = "#{item.title}の数量を#{cart_item.item_count}個に変更しました。"
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
