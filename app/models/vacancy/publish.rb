class Vacancy::Publish
  def publish(vacancy)
    vacancy.save!
    NotifyVacancyOnSlackWorker.perform_async(vacancy.id)
  end
end
