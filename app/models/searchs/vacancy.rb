# frozen_string_literal: true

module Searchs
  class Vacancy
    def initialize(repository = ::Vacancy.joins(:company).recent)
      @repository = repository
    end

    def list(query = nil)
      return @repository.recent if query.blank?

      query = query.split.map { |entry| "#{entry}:*" }.join(' & ')

      @repository.where(<<~SQL, query: query)
        tsv @@ to_tsquery('portuguese', :query) OR company_tsv @@ to_tsquery('portuguese', :query)
      SQL
    end

    def self.list(query = nil)
      new.list(query)
    end
  end
end
