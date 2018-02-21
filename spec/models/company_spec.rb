# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:url) }

  context 'validate company url' do
    it { is_expected.to allow_value('http://opensanca.com.br').for(:url) }
    it { is_expected.to allow_value('www.opensanca.com.br').for(:url) }
    it { is_expected.to allow_value('opensanca.com.br').for(:url) }
    it { is_expected.not_to allow_value('invalid').for(:url) }
  end

  it 'inserts http in company_url before validate' do
    company = build(:company, url: 'opensanca.com.br')
    company.valid?
    expect(company.url).to eq('http://opensanca.com.br')
  end
end
