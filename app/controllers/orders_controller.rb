
class OrdersController < ApplicationController
	before_action :authenticate_user_or_admin, except: [:index]
	before_action :authenticate_current_user, except: [:index]

	def index
		if user_signed_in?
			@order = current_user.orders.all
			@order_item = OrderItem.where(order_id: @order)
		elsif admin_signed_in?
			@status_name = "全て"
			@order_all = Order.all
			@orders = Order.all
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.all
		end
	end

	def orders_status1
		if admin_signed_in?
			@status_name = "注文受付"
			@order_all = Order.all
			@orders = Order.where(status: "注文受付")
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
		else
			redirect_to items_path
		end
	end

	def orders_status2
		if admin_signed_in?
			@status_name = "発送準備中"
			@order_all = Order.all
			@orders = Order.where(status: "発送準備中")
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
		else
			redirect_to items_path
		end
	end

	def orders_status3
		if admin_signed_in?
			@status_name = "発送済"
			@order_all = Order.all
			@orders = Order.where(status: "発送済")
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
		else
			redirect_to items_path
		end
	end

	def orders_status4
		if admin_signed_in?
			@status_name = "配達完了"
			@order_all = Order.all
			@orders = Order.where(status: "配達完了")
			@status1 = Order.where(status: "注文受付")
			@status2 = Order.where(status: "発送準備中")
			@status3 = Order.where(status: "発送済")
			@status4 = Order.where(status: "配達完了")
			@order_items = OrderItem.where(order_id: @orders)
		else
			redirect_to items_path
		end
	end

	def create
    order = Order.new(order_params)
    order.save
  	redirect_to orders_path
	end

	def new
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

  def authenticate_current_user
    if user_signed_in?
      if @user.id != current_user.id
        redirect_to items_path
      end
    end
  end

	def order_params
		params.require(:order).permit(:user_id, :address_id, :payment_id, :status, :total_count, :total_price_without_tax, :total_price, order_items_attributes: [:order_id, :item_id, :item_count, :total_price_without_tax])
	end

end
