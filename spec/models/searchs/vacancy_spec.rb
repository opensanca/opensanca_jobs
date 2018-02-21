# frozen_string_literal: true

require 'rails_helper'

describe Searchs::Vacancy, type: :search do
  describe '.list' do
    context 'without parameter' do
      it 'returns all vacancies' do
        vacancies = create_list(:vacancy, 5)

        expect(Searchs::Vacancy.list).to eq vacancies.reverse
      end
    end

    context 'with parameter' do
      let(:company)        { create(:company, name: 'Galactic Empire') }
      let!(:vacancy)       { create(:vacancy, job_title: 'programador ruby', company: company) }
      let!(:other_vacancy) { create(:vacancy, job_title: 'programador java') }

      subject { Searchs::Vacancy.list(keyword) }

      context 'with the exact keyword' do
        let(:keyword) { 'programador ruby' }

        it { is_expected.to eq([vacancy]) }
      end

      context 'with a similar keyword' do
        let(:keyword) { 'programadores ruby' }

        it { is_expected.to eq([vacancy]) }
      end

      context 'with company name' do
        let(:keyword) { 'Galactic Empire' }

        it { is_expected.to eq([vacancy]) }
      end
    end
  end
end
