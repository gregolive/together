class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@together.com'
  layout 'mailer'
end
