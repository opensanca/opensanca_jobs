# frozen_string_literal: true

class WelcomeUserWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.welcome_email(user).deliver
  end
end
