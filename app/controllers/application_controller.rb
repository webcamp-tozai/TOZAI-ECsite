class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
	before_action :set_genres
	
	PER_ITEM = 12

  def after_sign_in_path_for(resource)
		if admin_signed_in?
			admins_top_path
		else
			root_path
		end
  end

  def after_sing_out_path_for(resource)
  	root_path
  end

	# ransack用
	def set_search
		@search = Item.ransack(params[:q])
		@items = @search.result.page(params[:page]).reverse_order.per(PER_ITEM)
	end

	def set_genres
		@genres = Genre.all.order(genre_english: :asc)
	end

	private

  def authenticate_user_or_admin
    if admin_signed_in? || user_signed_in?
    else
      redirect_to root_path
    end
  end

  def authenticate_user
    if user_signed_in?
    else
      redirect_to root_path
    end
  end

  def authenticate_admin
    if admin_signed_in?
    else
    	redirect_to root_path
    end
  end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name_kanji,:given_name_kanji,:family_name_kana,:given_name_kana,:email,:phone_number,:post_code,:address])
		devise_parameter_sanitizer.permit(:sing_in, keys:[:email])
	end
end
