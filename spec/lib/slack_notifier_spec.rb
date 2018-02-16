# frozen_string_literal: true

require 'rails_helper'
require 'slack_notifier'

describe SlackNotifier, type: :model do
  let(:notifier_double) { double(:notifier) }

  before { allow(Slack::Notifier).to receive(:new).and_return(notifier_double) }

  let(:notifier) { described_class.new('#channel') }

  describe '#notify' do
    subject { notifier.notify('message') }

    context 'in development/test' do
      it 'does not notify the channel' do
        expect(notifier_double).not_to receive(:ping).with('message')

        subject
      end
    end

    context 'in production' do
      before { allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new('production')) }

      it 'notifies the channel' do
        expect(notifier_double).to receive(:ping).with('message')

        subject
      end
    end
  end
end
