class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def show
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:cart_item_id, :order_id, :given_name_kanji,:family_name_kana ,:given_name_kana ,:phone_number ,:email ,:encrypted_password ,:post_code ,:address)
  end

end
