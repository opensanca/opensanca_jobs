require "slack_notifier"

class NotifyVacancyOnSlackWorker
  include Sidekiq::Worker
  include Rails.application.routes.url_helpers

  def perform(vacancy_id)
    vacancy = Vacancy.find(vacancy_id)
    message = %Q(
    #{I18n.t('metatags.vacancy_description', job_title: vacancy.job_title, company_name: vacancy.company_name, location: vacancy.location)}

    veja a vaga em: #{vacancy_url(vacancy)}
    )
    SlackNotifier.new('#jobs').notify(message)
  end
end
