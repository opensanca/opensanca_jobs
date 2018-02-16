# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include FriendlyId

  EMAIL_REGEX      = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  URL_REGEX        = /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix
  MAX_VALID_PERIOD = 30.days

  friendly_id :slug_candidates, use: :slugged

  scope :recent, -> { where('created_at >= ?', MAX_VALID_PERIOD.ago.beginning_of_day).order(created_at: :desc) }

  validates :job_title, :location, :description, :how_to_apply, :company_name, :company_url, :company_email,
            presence: true

  validates :company_email, format: { with: EMAIL_REGEX }
  validates :company_url, format: { with: URL_REGEX }

  before_validation do
    self.company_url = "http://#{company_url}" unless company_url.nil? || company_url[0, 4] == 'http'
  end

  private

  def slug_candidates
    [
      %i[company_name job_title]
    ]
  end
end
