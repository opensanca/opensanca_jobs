# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Search vacancies' do
  scenario 'keeping the search field empty' do
    create_list(:vacancy, 3)

    visit root_path

    fill_in I18n.t('vacancies.search'), with: ''
    find('.input-group-btn button').click

    expect(page).to have_selector('section.vacancy-item', count: 3)
  end

  scenario 'search for a specific vacancy' do
    create_list(:vacancy, 2)
    create(:vacancy, job_title: 'Stormtrooper')

    visit root_path

    fill_in I18n.t('vacancies.search'), with: 'Stormtrooper'
    find('.input-group-btn button').click

    expect(page).to have_selector('section.vacancy-item', count: 1)
    expect(page).to have_content('Stormtrooper')
  end
end
