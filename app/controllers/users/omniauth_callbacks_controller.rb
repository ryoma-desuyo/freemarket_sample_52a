class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_for :google
  end
  
  def facebook
    callback_for :facebook
  end

  def callback_for(provider)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
    end
  end

  def failure
    redirect_to new_user_session_path
  end

end