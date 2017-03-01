require "rails_helper"

RSpec.describe Vacancy, type: :model do
  it { is_expected.to validate_presence_of(:job_title) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:description) }

  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:company_url) }
  it { is_expected.to validate_presence_of(:company_email) }
end
