class UserMailer < ApplicationMailer
  default from: 'welcome@together.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Together')
  end
end
