# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  before_action :authorize_user!, only: [:create]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  


  

  def create
    if !current_user.admin?
      user = User.create!(user_params)
      session[:user_id] = user.id
      redirect_to new_user_session_path
    else
      super
    end
  end
   
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:image, :avatar])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:image, :avatar])
  end


  def authorize_user!
    if current_user == nil
      redirect_to root_path, notice: 'You are not authorized to perform this action. Only Admins are allowed to perform this action.'
    else
      if !current_user.admin
       redirect_to root_path, notice: 'You are not authorized to perform this action.'
      else
        redirect_to new_user_session_path, notice: 'hola!'
      end
    end
  end
  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private
    def user_params
      params.require(:user).permit(:email, :password, :avatar, :password_confirmation, :name)
    end
 
end
