class ApplicationController < ActionController::Base
 	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if admin_signed_in?
			admins_top_path
		else
			root_path
		end
	end
	def after_sign_out_path_for(resource)
		root_path
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name_kanji, :given_name_kanji, :family_name_kana, :given_name_kana, :phone_number, :email, :post_code, :address])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
	end
end
