class UsersController < ApplicationController
  before_action :authenticate_user_or_admin, except: [:index]
  before_action :user_exists, except: [:index]
  before_action :suspending_user_account
  before_action :authenticate_current_user, except: [:index]

  def index
    if admin_signed_in?
      @users = User.all
    else
      redirect_to items_path
    end
  end

  def edit
  end

  def edit_password
  end

  def order_history
    @user = User.find(params[:id])
    @order = Order.where(user_id: @user).page(params[:page]).reverse_order
  end

  def show
    @address = Address.where(user_id: params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:user_updated] = "登録情報を保存しました"
    else
      redirect_to user_path(@user.id)
      flash[:user_update_faled] = "変更できませんでした。入力内容を確認してください。"
    end
  end

  def unsubscribe
    status = params[:user][:member_status].to_i
    if status == 0
      redirect_to confirm_path(current_user)
      flash[:unsubscribe_faled] = "チェックを入れてください"
    else
      @user.update(member_status: params[:user][:member_status])
      redirect_to logout_path
      flash[:unsubscribed] = "退会処理が完了しました。ご利用ありがとうございました。"
    end
  end

=begin
余裕あれば実装
  def update_status
    @user.update_attribute(:member_status, params[:user][:member_status])
    redirect_to user_path(@user.id)
    if @user.member_status == 0
      flash[:user_restored] = "#{@user.family_name_kanji}#{@user.given_name_kanji}のユーザーステータスを【通常会員】に変更しました"
    elsif @user.member_status == 1
      flash[:user_deleted] = "#{@user.family_name_kanji}#{@user.given_name_kanji}のユーザーステータスを【退会】に変更しました"
    elsif @user.member_status == 2
      flash[:user_force_deleted] = "#{@user.family_name_kanji}#{@user.given_name_kanji}のユーザーステータスを【強制退会】に変更しました"
    end
  end
=end
  private

  def authenticate_user_or_admin
    if admin_signed_in? || user_signed_in?
    else
      redirect_to items_path
    end
  end

  def user_exists
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to items_path
    end
  end

  def suspending_user_account
    if user_signed_in?
      if current_user.member_status == 1
        redirect_to destroy_user_session_path(current_user)
        flash[:deleted_user_account] = "退会済みのアカウントです。"
      elsif current_user.member_status == 2
        redirect_to destroy_user_session_path(current_user)
        flash[:force_deleted_user_account] = "このアカウントは管理者によって強制退会となったため、ご利用いただけません。"
      end
    end
  end

  def authenticate_current_user
    if user_signed_in?
      if @user.id != current_user.id
        redirect_to items_path
      end
    end
  end

  def user_params
    params.require(:user).permit(:cart_item_id, :order_id, :family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :phone_number, :email, :password, :post_code, :address, :member_status)
  end

  def order_params
    params.require(:order).permit(:user_id, :address_id, :payment_id, :status, :total_count, :total_price_without_tax, :total_price, order_items_attributes: [:order_id, :item_id, :item_count, :total_price_without_tax])
  end

end
