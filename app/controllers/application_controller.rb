# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :check_company_subdomain

  private

  def current_company
    current_user.company
  end

  def check_company_subdomain
    subdomain = request.subdomain
    return if subdomain.empty? || subdomain == 'www'
    matching_company = Company.find_by domain: subdomain
    not_found unless matching_company
    @filtered_by = matching_company
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
