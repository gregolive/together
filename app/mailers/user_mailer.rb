class UserMailer < ApplicationMailer
  default from: 'gregoryolive@outlook.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://together-social.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Together')
  end
end
