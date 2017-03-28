class Vacancy::Publish
  def initialize(worker: NotifyVacancyOnSlackWorker)
    @worker = worker
  end

  def publish(vacancy)
    vacancy.save!
    @worker.perform_async(vacancy.id)
  end
end
