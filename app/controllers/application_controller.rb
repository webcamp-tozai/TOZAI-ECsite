class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys:[:famili_name_kanji,:given_name_kanji])
  	devise_parameter_sanitizer.permit(:sing_in, keys:[:famili_name_kanji,:given_name_kanji])
  end
end
