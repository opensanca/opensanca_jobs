# frozen_string_literal: true

class Vacancy < ApplicationRecord
  include FriendlyId

  MAX_VALID_PERIOD = 30.days

  friendly_id :slug_candidates, use: :slugged

  belongs_to :company
  delegate :name, :url, to: :company, prefix: true, allow_nil: true

  scope :recent, -> { where(created_at: MAX_VALID_PERIOD.ago.beginning_of_day..Time.zone.now).order(created_at: :desc) }

  validates :job_title, :location, :description, :how_to_apply, presence: true

  private

  def slug_candidates
    [
      %i[company_name job_title]
    ]
  end
end
