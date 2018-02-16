# frozen_string_literal: true

class Vacancy
  class Publish
    def initialize(worker: NotifyVacancyWorker)
      @worker = worker
    end

    def publish(vacancy)
      vacancy.save!
      @worker.perform_async(vacancy.id)
    end
  end
end
