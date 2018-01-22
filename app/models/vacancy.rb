class Vacancy < ApplicationRecord
  include FriendlyId

  MAX_VALID_PERIOD = 30.days

  friendly_id :slug_candidates, use: :slugged

  scope :recent, -> { where('created_at >= ?', MAX_VALID_PERIOD.beginning_of_day).order(created_at: :desc) }

  validates :job_title, :location, :description, :how_to_apply, :company_name, :company_url, :company_email,
            presence: true

  validates :company_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :company_url, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix }

  before_validation do
    unless self.company_url.nil? || self.company_url[0, 4] == "http"
      self.company_url = "http://#{self.company_url}"
    end
  end

  private

  def slug_candidates
    [
      [:company_name, :job_title]
    ]
  end
end
