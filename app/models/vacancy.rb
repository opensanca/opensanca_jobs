class Vacancy < ApplicationRecord
  validates :job_title, :location, :description, :how_to_apply, :company_name, :company_url, :company_email,
            presence: true

  validates :company_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :company_url, format: { with: /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix }

  before_validation do
    unless self.company_url.nil? || self.company_url[0, 4] == "http"
      self.company_url = "http://#{self.company_url}"
    end
  end

  def self.search(query = nil)
    return Vacancy.all if query.blank?

    lang = I18n.locale == :'pt-BR' ? "portuguese" : "english"

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

    self.find_by_sql([sql, query.split(' ').join('|')])
  end
end
