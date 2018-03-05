class VacancyDontBelongsToUser < StandardError

  def initialize
    super I18n.t('vacancies.edit.dont_belongs_to_you')
  end
end