# frozen_string_literal: true

require 'spec_helper'

describe User do
  describe '#company_name' do
    let(:company) { build(:company, name: 'Galactic Empire') }
    let(:user) { build(:user, company: company) }

    subject { user.company_name }

    it { is_expected.to eq('Galactic Empire') }
  end
end
