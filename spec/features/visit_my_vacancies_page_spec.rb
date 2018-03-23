# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'My Vacancies Page', type: :feature do
  context 'with a logged user' do
    let(:user) { create(:user) }

    scenario 'show the vacancies list only for current company' do
      create(:vacancy, company_id: user.company.id)
      create(:vacancy, company: create(:company))
      visit root_path(as: user)

      click_link I18n.t('shared.navbar.my_vacancies')

      expect(current_path).to eql(company_vacancies_path)
      expect(page).to have_content(I18n.t('vacancies.index.vacancies'))
      expect(page).to have_selector '.vacancy-item', count: 1
    end
  end
end
