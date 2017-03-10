class Searchs::Vacancy
  def initialize(repository = Vacancy)
    @repository = repository
  end

  def list(query = nil, lang = nil)
    return @repository.all if query.blank?

    lang ||= I18n.locale == :'pt-BR' ? "portuguese" : "english"

    sql = %{
      select
        id,
        job_title,
        location,
        description,
        company_name,
        document
      from
        (select
          id,
          job_title,
          location,
          description,
          company_name,
          to_tsvector('#{lang}', location) || ' ' ||
          to_tsvector('#{lang}', company_name) || ' ' ||
          to_tsvector('#{lang}', job_title) || ' ' ||
          to_tsvector('#{lang}', description) as document
        from vacancies) vacancies
      where
        vacancies.document @@ to_tsquery('#{lang}', ?)
    }

    consult = query.split(' ').map { |e| "#{e}:*" }.join('&')
    @repository.find_by_sql([sql, consult])
  end

  def self.list(query = nil, lang = nil)
    new.list(query, lang)
  end
end
