class AdminsController < ApplicationController

  before_action :authenticate_admin!

  def top
  end

  def index
  end

  def show
    if Admin.exists?(params[:id])
      @admin = Admin.find(params[:id])
    else
      redirect_to edit_admin_path(current_admin.id)
    end
  end

  def edit
    if Admin.exists?(params[:id])
      @admin = Admin.find(params[:id])
      if @admin.id != current_admin.id
        redirect_to edit_admin_path(current_admin.id)
      end
    else
      redirect_to edit_admin_path(current_admin.id)
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      sign_in(@admin, :bypass => true)
      redirect_to edit_admin_path(@admin.id)
      flash[:profile_updated] = "登録情報を保存しました"
    else
      redirect_to edit_admin_path(current_admin.id)
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :email, :password, :id)
  end

end
