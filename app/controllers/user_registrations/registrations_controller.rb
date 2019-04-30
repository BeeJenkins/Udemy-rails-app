class UserRegistrations::RegistrationsController < Devise::RegistrationsController


  private

  def sign_up_params
    params.require(:user).permit(:email, :current_password, :password_confirmation, :first_name, :last_name, :username)
  end

  def account_update_params
    params.require(:user).permit(:email, :current_password, :password_confirmation, :first_name, :last_name, :username)
  end
end