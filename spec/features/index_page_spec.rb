# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Visit index page', type: :feature do
  scenario 'lists all vacancies in the index page' do
    vacancy1, vacancy2, vacancy3 = create_list(:vacancy, 3)
    old_vacancy = create(:vacancy, job_title: 'An old job', created_at: (Vacancy::MAX_VALID_PERIOD + 1.day).ago)

    visit root_path

    expect(page).to have_content(I18n.t('vacancies.index.title'))

    expect(page).not_to have_content(old_vacancy.job_title)

    # Displays all vacancies
    expect(page).to have_content(vacancy1.job_title)
    expect(page).to have_content(vacancy2.job_title)
    expect(page).to have_content(vacancy3.job_title)
  end

  scenario 'when does not have any vacancy, display a custom message' do
    visit root_path

    expect(page).to have_content(I18n.t('vacancies.index.no_vacancies'))
  end
end
