class UsersController < ApplicationController
  def index
  end

  def edit
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to user_path(current_user.id)
      end
    else
      redirect_to user_path(current_user.id)
    end
  end

  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      sign_in(@user, :bypass => true)
      redirect_to user_path(@user.id)
      flash[:profile_updated] = "登録情報を保存しました"
    else
      redirect_to user_path(current_user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:cart_item_id, :order_id, :family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :phone_number, :email, :encrypted_password, :post_code, :address, :id)
  end

end
