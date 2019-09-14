# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def basic_info
    @user = User.new
  end

  def number
    @user = User.new(user_params)
  end

  def address
    @user = User.new(user_params)
  end

  def credit
  end

  def done
  end

  def create
    @user = User.new(user_params)
    session[:user_id] = @user.id

    if @user.save
      redirect_to sign_up_done_path
    end
  end

  private

  def user_params
    permit_keys=[:nickname,:email,:password,:password_confirmation,:number,:family_name,:first_name,:family_name_kana,:first_name_kana,
                  :postal_code,:prefecture,:city,:house_number,:building_name,:phone_number,:birthday]
    params.require(:user).permit(permit_keys)
  end
end
