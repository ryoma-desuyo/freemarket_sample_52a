class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  protect_from_forgery with: :exception
  before_action :congigure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    mypages_path
  end

  def after_sign_out_path_for(resource)
    products_path
  end

  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  protected

  def congigure_permitted_parameters
    added_keys = [:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :profile_icon, :self_introduction]
    
    devise_parameter_sanitizer.permit(:sign_up, keys: added_keys)
  end
end
