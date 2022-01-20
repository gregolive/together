# SendGrid mailer
ActionMailer::Base.smtp_settings = {
  user_name: 'apikey',
  password: ENV['SENDGRID_API'],
  domain: 'https://together-social.herokuapp.com/',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
