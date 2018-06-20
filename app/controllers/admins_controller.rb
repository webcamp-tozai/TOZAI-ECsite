class AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :admin_exists, except: [:index, :top]
  before_action :suspending_admin_account

  def index
    @admins = Admin.all
  end

  def edit
  end

  def edit_password
    if @admin.id != current_admin.id && current_admin.is_main_administer == false
      redirect_to edit_admin_path(@admin)
    end
  end

  def update
    if @admin.id != current_admin.id && current_admin.is_main_administer == false
      redirect_to admins_top_path
    else
      if @admin.update(admin_params)
        sign_in(current_admin, :bypass => true)
        redirect_to edit_admin_path(@admin.id)
        flash[:admin_updated] = "管理者 #{@admin.family_name_kanji}#{@admin.given_name_kanji}の登録情報を変更しました"
      else
        redirect_to edit_admin_path(current_admin.id)
        flash[:admin_update_faled] = "変更できませんでした。入力内容を確認してください。"
      end
    end
  end

  def update_status
    if current_admin.is_main_administer == false
      redirect_to admins_top_path
    else
      if @admin.is_deleted == false
        @admin.update_attribute(:is_deleted, true)
        redirect_to admins_path
        flash[:admin_suspended] = "管理者 #{@admin.family_name_kanji}#{@admin.given_name_kanji}のアカウントを停止しました"
      elsif @admin.is_deleted == true
        @admin.update_attribute(:is_deleted, false)
        redirect_to admins_path
        flash[:admin_restored] = "管理者 #{@admin.family_name_kanji}#{@admin.given_name_kanji}のアカウントを復旧しました"
      end
    end
  end

  private

  def admin_exists
    if Admin.exists?(params[:id])
      @admin = Admin.find(params[:id])
    else
      redirect_to admins_top_path
    end
  end

  def suspending_admin_account
    if admin_signed_in?
      if current_admin.is_deleted == true
        redirect_to destroy_admin_session_path
        flash[:suspending_admin_account] = "あなたのアカウントは管理者によって停止されました。アカウントを復旧するにはメイン管理者に連絡を取ってください。"
      end
    end
  end

  def admin_params
    params.require(:admin).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :email, :password, :is_deleted)
  end

end
