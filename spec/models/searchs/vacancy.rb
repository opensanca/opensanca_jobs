Rspec.describe Searchs::Vacancy, type: :model do
  describe '.list' do
    context 'without parameter' do
      it 'returns all vacancies' do
        vacancies = create_list(:vacancy, 5)

        expect(Searchs::Vacancy.list).to eq vacancies
      end
    end

    context 'with parameter' do
      it 'returns selected results' do
        vacancy_one = create(:vacancy, job_title: 'java programmer')
        create(:vacancy, job_title: 'ruby developer')

        expect(Searchs::Vacancy.list('programmers java', 'english')).to eq([vacancy_one])
      end

      it 'returns results that contains search param' do
        vacancy_one = create(:vacancy, job_title: 'ruby developer')
        create(:vacancy, job_title: 'java programmer')

        expect(Searchs::Vacancy.list('dev ruby', 'english')).to eq([vacancy_one])
      end
    end

  end
end
