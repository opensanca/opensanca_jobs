# frozen_string_literal: true

require 'rails_helper'

describe Vacancy, type: :model do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:how_to_apply) }
  it { is_expected.to validate_presence_of(:job_title) }
  it { is_expected.to validate_presence_of(:location) }

  describe '.recent' do
    it 'sorts the vacancies by the date from the newest to the oldest' do
      _oldest = create(:vacancy, created_at: 1.year.ago)
      newest  = create(:vacancy, created_at: 5.days.ago)

      result = described_class.recent

      expect(result.first).to eq(newest)
    end

    it 'does not display jobs longer than the maximum period' do
      max_period = Vacancy::MAX_VALID_PERIOD
      _old_job = create(:vacancy, created_at: (max_period + 1.day).ago)
      newest   = create(:vacancy, created_at: max_period.ago)

      result = described_class.recent

      expect(result).to eq([newest])
    end
  end

  describe '#company_name' do
    let(:company) { build(:company, name: 'Galactic Empire') }
    let(:vacancy) { build(:vacancy, company: company) }

    subject { vacancy.company_name }

    it { is_expected.to eq('Galactic Empire') }
  end

  describe '#company_url' do
    let(:company) { build(:company, url: 'http://galacticempire.com') }
    let(:vacancy) { build(:vacancy, company: company) }

    subject { vacancy.company_url }

    it { is_expected.to eq('http://galacticempire.com') }
  end
end
