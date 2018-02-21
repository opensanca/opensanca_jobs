# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    user.forgot_password!

    mail(to: user.email, subject: t('.welcome_email.subject'))
  end
end
