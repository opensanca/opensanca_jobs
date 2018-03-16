# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'

describe Vacancy::Publish, type: :model do
  describe '#publish' do
    subject { described_class.new.publish(vacancy) }

    context 'with a valid vacancy' do
      let(:vacancy) { build(:vacancy) }

      it 'creates the vacancy on the database' do
        expect { subject }.to change(Vacancy, :count).by(1)
      end

      it 'enqueues the notification to slack' do
        expect { subject }.to change(NotifyVacancyWorker.jobs, :size).by(1)
      end
    end

    context 'with a vacancy with invalid parameters' do
      let(:vacancy) { build(:vacancy, job_title: nil) }

      it 'raises an error' do
        expect { subject }.to raise_error(ActiveRecord::RecordInvalid)
      end

      it 'does not enqueue the notification to slack' do
        expect do
          subject
        rescue StandardError
          nil
        end.not_to change(NotifyVacancyWorker.jobs, :size)
      end
    end
  end
end
