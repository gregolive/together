class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.with(user: @user).welcome_email.deliver_now
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation, :current_password)
  end
end