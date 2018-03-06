# frozen_string_literal: true

require 'rails_helper'

describe UserMailer, type: :mailer do
  let(:company) { build(:company, name: 'Galactic Empire') }
  let(:user) { build(:user, company: company) }

  describe '#welcome_email' do
    let(:email) { described_class.welcome_email(user) }

    it 'renders the headers' do
      expect(email.subject).to eq('Welcome to OpenJobs!')
      expect(email.to).to eq([user.email])
      expect(email.from).to eq(['no-reply@openjobs.me'])
    end

    context 'body' do
      subject { email.body.encoded }

      it { is_expected.to match('Welcome to OpenJobs, Galactic Empire') }
    end
  end
end
