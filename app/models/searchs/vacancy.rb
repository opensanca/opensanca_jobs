class Searchs::Vacancy
  def initialize(repository = ::Vacancy)
    @repository = repository
  end

  def list(query = nil, lang = nil)
    return @repository.recent if query.blank?

    sql = %{
      SELECT
        id,
        job_title,
        location,
        description,
        company_name,
        created_at,
        slug
      FROM vacancies
      WHERE
        vacancies.tsv @@ to_tsquery('portuguese', ?)
      ORDER BY created_at DESC
    }

    consult = query.split(' ').map { |entry| "#{entry}:*" }.join('&')
    @repository.find_by_sql([sql, consult])
  end

  def self.list(query = nil, lang = nil)
    new.list(query, lang)
  end
end
