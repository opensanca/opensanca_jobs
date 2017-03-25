class Vacancy::Publish
  def initialize(vacancy)
    @vacancy = vacancy
  end

  def publish
    @vacancy.save!
    NotifyVacancyOnSlackWorker.perform_async(@vacancy.id)
  end
end
