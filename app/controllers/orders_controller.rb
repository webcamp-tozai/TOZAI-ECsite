class OrdersController < ApplicationController
	before_action :authenticate_user_or_admin, except: [:index]
	before_action :authenticate_admin, except: [:index, :create, :new]
	before_action :find_orders, only: [:index, :orders_status1, :orders_status2, :orders_status3, :order_status4]

	def index
		if user_signed_in?
			@order = current_user.orders.all.page(params[:page]).reverse_order
			@order_item = OrderItem.where(order_id: @order)
		elsif admin_signed_in?
			@status_name = "全て"
			@order_all = Order.all
			@orders = Order.all
			@order_items = OrderItem.all
		end
	end

	def orders_status1
			@status_name = "注文受付"
			@orders = Order.where(status: "注文受付")
	end

	def orders_status2
			@status_name = "発送準備中"
			@orders = Order.where(status: "発送準備中")
	end

	def orders_status3
			@status_name = "発送済"
			@orders = Order.where(status: "発送済")
	end

	def orders_status4
			@status_name = "配達完了"
			@orders = Order.where(status: "配達完了")
	end

	def create
		find_cart_items
  	order = Order.new(order_params)
  	cart_items = current_user.cart_items
  	cart_items.each do |cart_item|
  		item = Item.find(cart_item.item_id)
  		# 在庫がゼロになった時の検証用
  		# item.stock = 0
  		# 販売終了になった時の検証用
  		# item.is_deleted = true
    	if item.stock == 0
    		cart_item.destroy
    		redirect_to new_order_path
    		flash[:cart_item_force_destroyed] = "#{item.title}は在庫切れになったため、カートから削除しました。"
    		return
    	elsif item.is_deleted == true
    		cart_item.destroy
    		redirect_to new_order_path
    		flash[:item_is_deleted] = "#{item.title}は販売終了となったため、カートから削除しました。"
    		return
    	elsif item.stock - cart_item.item_count < 0
    		difference_negative = item.stock - cart_item.item_count
    		difference = 0 - difference_negative
    		item_count = cart_item.item_count - difference
    		cart_item.update(item_count: item_count)
    		redirect_to new_order_path
    		flash[:order_created_faled] = "#{item.title}の数量が在庫数を上回っています。こちらの商品は最大で#{cart_item.item_count}個購入できます。"
    		flash[:cart_item_updated] = "#{item.title}の数量を#{cart_item.item_count}個に変更しました"
    		return
    	end
    end
	  if order.save
		  cart_items.each do |cart_item|
				item = Item.find(cart_item.item_id)
		  	stock = item.stock - cart_item.item_count
		  	item.update(stock: stock)
	  	end
			cart_items.destroy_all
	 		redirect_to orders_path
	 	else
	 		redirect_to new_order_path
	 	end
	end

	def new
		find_cart_items
		@payments = Payment.all
		@order = Order.new
		@order.order_items.build
		@cart_items = current_user.cart_items.all
		@address = Address.where(user_id: current_user.id)
	end

	def edit
	end

	def show
	end

	def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to orders_path(order_params)
    flash[:order_updated] = "変更を保存しました"
	end

	private

  def authenticate_user_or_admin
    if admin_signed_in? || user_signed_in?
    else
      redirect_to items_path
    end
  end

  def authenticate_admin
  	if admin_signed_in?
	  else
	  	redirect_to items_path
	  end
  end

  def find_orders
		@order_all = Order.all
		@status1 = Order.where(status: "注文受付")
		@status2 = Order.where(status: "発送準備中")
		@status3 = Order.where(status: "発送済")
		@status4 = Order.where(status: "配達完了")
		@order_items = OrderItem.where(order_id: @orders)
  end

  def find_cart_items
  	if CartItem.find_by(user_id: current_user.id)
		else
			redirect_to items_path
		end
  end

	def order_params
		params.require(:order).permit(:user_id, :address_id, :payment_id, :status, :total_count, :total_price_without_tax, :total_price, order_items_attributes: [:order_id, :item_id, :item_count, :total_price_without_tax])
	end

end
