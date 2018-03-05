# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'My Vacancies Page', type: :feature do
  context 'with a logged user' do
    let(:user) { create(:user) }

    scenario 'show the vacancies list' do
      create(:vacancy)
      visit root_path(as: user)

      click_link I18n.t('shared.navbar.my_vacancies')

      expect(current_path).to eql(company_vacancies_path)
      expect(page).to have_content(I18n.t('vacancies.edit.vacancies'))
      expect(page).to have_selector '.vacancy-list', count: 1
    end
  end
end
