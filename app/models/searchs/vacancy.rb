# frozen_string_literal: true

module Searchs
  class Vacancy
    def initialize(repository = ::Vacancy.joins(:company).recent)
      @repository = repository
    end

    def list(query = nil, company = nil)
      scope = company.present? ? @repository.where(company: company) : @repository
      return scope.recent if query.blank?

      query = query.split.map { |entry| "#{entry}:*" }.join(' & ')
      scope.where(<<~SQL, query: query)
        tsv @@ to_tsquery('portuguese', :query) OR company_tsv @@ to_tsquery('portuguese', :query)
      SQL
    end

    def self.list(query = nil, company = nil)
      new.list(query, company)
    end
  end
end
