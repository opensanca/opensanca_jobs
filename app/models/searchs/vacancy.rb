class Searchs::Vacancy
  def initialize(repository = Vacancy)
    @repository = repository
  end

  def list(query = nil, lang = nil)
    return @repository.recent if query.blank?

    lang ||= I18n.locale == :'pt-BR' ? "portuguese" : "english"

    sql = %{
      SELECT
        id,
        job_title,
        location,
        description,
        company_name,
        created_at,
        document
      FROM
        (SELECT
          id,
          job_title,
          location,
          description,
          company_name,
          created_at,
          to_tsvector('#{lang}', location) || ' ' ||
          to_tsvector('#{lang}', company_name) || ' ' ||
          to_tsvector('#{lang}', job_title) || ' ' ||
          to_tsvector('#{lang}', description) AS document
        FROM vacancies) vacancies
      WHERE
        vacancies.document @@ to_tsquery('#{lang}', ?)
      ORDER BY created_at DESC
    }

    consult = query.split(' ').map { |entry| "#{entry}:*" }.join('&')
    @repository.find_by_sql([sql, consult])
  end

  def self.list(query = nil, lang = nil)
    new.list(query, lang)
  end
end
