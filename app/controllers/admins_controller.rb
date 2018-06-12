class AdminsController < ApplicationController
  def top
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def admin_params
    params.require(:admin).permit(:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :email, :encrypted_password)
  end

end
