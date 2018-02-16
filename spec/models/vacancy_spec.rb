# frozen_string_literal: true

require 'rails_helper'

describe Vacancy, type: :model do
  it { is_expected.to validate_presence_of(:job_title) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:how_to_apply) }

  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:company_url) }
  it { is_expected.to validate_presence_of(:company_email) }

  context 'validate company email' do
    it { is_expected.to allow_value('test@email.com').for(:company_email) }
    it { is_expected.not_to allow_value('test').for(:company_email) }
    it { is_expected.not_to allow_value('test@qwe').for(:company_email) }
    it { is_expected.not_to allow_value('test.com').for(:company_email) }
  end

  context 'validate company url' do
    it { is_expected.to allow_value('http://opensanca.com.br').for(:company_url) }
    it { is_expected.to allow_value('www.opensanca.com.br').for(:company_url) }
    it { is_expected.to allow_value('opensanca.com.br').for(:company_url) }
    it { is_expected.not_to allow_value('invalid').for(:company_url) }
  end

  it 'inserts http in company_url before validate' do
    vacancy = Vacancy.new attributes_for(:vacancy, company_url: 'opensanca.com.br')
    vacancy.valid?
    expect(vacancy.company_url).to eq('http://opensanca.com.br')
  end

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
end
