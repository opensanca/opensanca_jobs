# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  private

  def current_company
    current_user.company
  end
end
