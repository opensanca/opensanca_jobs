# frozen_string_literal: true

require 'slack_notifier'

class NotifyVacancyWorker
  include Sidekiq::Worker
  include Rails.application.routes.url_helpers

  def perform(vacancy_id, notifier = SlackNotifier.new('#jobs'))
    vacancy = Vacancy.find(vacancy_id)
    message = %(
    #{I18n.t('metatags.vacancy_description', job_title: vacancy.job_title, company_name: vacancy.company_name,
                                             location: vacancy.location)}

    veja a vaga em: #{vacancy_url(vacancy)}
    )
    notifier.notify(message)
  end
end
