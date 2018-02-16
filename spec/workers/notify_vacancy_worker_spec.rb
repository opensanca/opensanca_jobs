# frozen_string_literal: true

require 'rails_helper'

describe NotifyVacancyWorker, type: :worker do
  describe '#perform' do
    let(:vacancy_id) { create(:vacancy).id }
    let(:notifier) { double(:notifier) }

    subject { described_class.new.perform(vacancy_id, notifier) }

    it 'notifies the slack' do
      expect(notifier).to receive(:notify)

      subject
    end
  end
end
