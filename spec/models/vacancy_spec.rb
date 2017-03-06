require "rails_helper"

RSpec.describe Vacancy, type: :model do
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
    vacancy = Vacancy.new attributes_for(:vacancy, company_url: "opensanca.com.br")
    vacancy.valid?
    expect(vacancy.company_url).to eq("http://opensanca.com.br")
  end

  context '.search' do
    it 'returns all vacancies' do
      vacancies = create_list(:vacancy, 5)

      expect(Vacancy.search).to eq vacancies
    end

    it 'returns selected results' do
      vacancy_one = create(:vacancy, job_title: 'java programmer')
      vacancy_two = create(:vacancy, job_title: 'java developer')
      create(:vacancy, job_title: 'ruby engineer')

      expect(Vacancy.search('programmers java')).to eq([vacancy_one, vacancy_two])
    end
  end
end
