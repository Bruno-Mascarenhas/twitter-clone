# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'brunomasck@gmail.com'
  layout 'mailer'
end
