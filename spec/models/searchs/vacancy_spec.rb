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
      it 'returns results that contains search param' do
        vacancy_one = create(:vacancy, job_title: 'programador ruby')
        create(:vacancy, job_title: 'programador java')

        expect(Searchs::Vacancy.list('programador ruby')).to eq([vacancy_one])
      end

      it 'returns results that contains a similar keyword in search param' do
        vacancy_one = create(:vacancy, job_title: 'programador ruby')
        create(:vacancy, job_title: 'programador java')

        expect(Searchs::Vacancy.list('programadores ruby')).to eq([vacancy_one])
      end
    end

  end
end
