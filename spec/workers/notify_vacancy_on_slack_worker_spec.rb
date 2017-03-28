require 'rails_helper'

describe NotifyVacancyOnSlackWorker, type: :worker do
  describe '#perform' do
    let(:vacancy_id) { create(:vacancy).id }

    subject { described_class.new.perform(vacancy_id) }

    it 'notifies the slack' do
      expect_any_instance_of(SlackNotifier).to receive(:notify)

      subject
    end
  end
end
