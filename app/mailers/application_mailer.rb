class ApplicationMailer < ActionMailer::Base
  default from: ENV["Gmail"] 
  layout 'mailer'
end
