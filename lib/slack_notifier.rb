# frozen_string_literal: true

class SlackNotifier
  def initialize(channel)
    @notifier = Slack::Notifier.new(ENV['SLACK_NOTIFIER_WEBHOOK_URL'], channel: channel, username: 'OpenJobs')
  end

  def notify(message)
    return unless Rails.env.production?
    @notifier.ping(message)
  end
end
