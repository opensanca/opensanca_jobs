# frozen_string_literal: true

module Searchs
  class Vacancy
    def initialize(repository = ::Vacancy.joins(:company).recent)
      @repository = repository
    end

    def list(query = nil, company = nil)
      if query.blank?
        vacancies = @repository.recent
      else
        query = query.split.map { |entry| "#{entry}:*" }.join(' & ')
        vacancies = @repository.where(<<~SQL, query: query)
          tsv @@ to_tsquery('portuguese', :query) OR company_tsv @@ to_tsquery('portuguese', :query)
        SQL
      end
      vacancies = vacancies.where company: company if company
      vacancies
    end

    def self.list(query = nil, company = nil)
      new.list(query, company)
    end
  end
end
