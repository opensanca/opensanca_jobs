class Searchs::Vacancy
  def initialize(repository = ::Vacancy)
    @repository = repository
  end

  def list(query = nil)
    return @repository.recent if query.blank?

    query = query.split(' ').map { |entry| "#{entry}:*" }.join(' & ')

    @repository.recent.where("tsv @@ to_tsquery('portuguese', :query)", query: query)
  end

  def self.list(query = nil)
    new.list(query)
  end
end
