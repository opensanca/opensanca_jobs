# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception
  before_action :filter_by_company, if: :company_subdomain?

  private

  def current_company
    current_user.company
  end

  def filter_by_company
    @filter_by = matching_company || not_found
  end

  def company_subdomain?
    subdomain = request.subdomain
    !subdomain.empty? && subdomain != 'www'
  end

  def matching_company
    Company.find_by(domain: request.subdomain)
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end
end
