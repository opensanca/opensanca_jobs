class Vacancy < ApplicationRecord
  validates :job_title, :location, :description, :company_name, :company_url, :company_email, presence: true
end
