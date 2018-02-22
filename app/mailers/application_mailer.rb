# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@openjobs.me'
  layout 'mailer'
end
