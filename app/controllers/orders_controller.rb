class OrdersController < ApplicationController
	before_action :authenticate_user_or_admin, except: [:index]
	before_action :authenticate_admin, except: [:create, :new]
	before_action :authenticate_user

	def index
		@status_name = "全て"
		@orders = Order.all.page(params[:page]).reverse_order
		@order_all = Order.all
		@status1 = Order.where(status: "注文受付")
		@status2 = Order.where(status: "発送準備中")
		@status3 = Order.where(status: "発送済")
		@status4 = Order.where(status: "配達完了")
		@order_items = OrderItem.all
	end

	def orders_status1
			@status_name = "注文受付"
			@orders = Order.where(status: "注文受付")
			@order_all = Order.all
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
	end

	def orders_status2
			@status_name = "発送準備中"
			@orders = Order.where(status: "発送準備中")
			@order_all = Order.all
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
	end

	def orders_status3
			@status_name = "発送済"
			@orders = Order.where(status: "発送済")
			@order_all = Order.all
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
	end

	def orders_status4
			@status_name = "配達完了"
			@orders = Order.where(status: "配達完了")
			@order_all = Order.all
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
	end

	def create
		find_cart_items
  	order = Order.new(order_params)
  	cart_items = current_user.cart_items
  	cart_items.each do |cart_item|
  		item = Item.find(cart_item.item_id)
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
	 		redirect_to order_history_path(current_user)
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

	def update
		path = Rails.application.routes.recognize_path(request.referer)
		if path[:controller] == "orders"
	    order = Order.find(params[:id])
	    order.update(order_params)
	    redirect_to orders_path(order_params)
	    flash[:order_updated] = "変更を保存しました"
	  elsif path[:controller] == "users"
	  	order = Order.find(params[:id])
	  	order.update(order_params)
	  	user = User.find(order.user_id)
	  	redirect_to order_history_path(user)
	  end
	end

	def show
		redirect_to root_path
	end

	private

  def find_cart_items
  	if CartItem.find_by(user_id: current_user.id)
		else
			redirect_to root_path
		end
  end

	def order_params
		params.require(:order).permit(:user_id, :address_id, :payment_id, :status, :total_count, :total_price_without_tax, :total_price, order_items_attributes: [:order_id, :item_id, :item_count, :total_price_without_tax])
	end

end
