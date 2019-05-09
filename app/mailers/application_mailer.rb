# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'contact.melomaniacs@gmail.com'
  layout 'mailer'
end
