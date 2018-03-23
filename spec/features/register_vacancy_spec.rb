# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User register a Vacancy' do
  context 'with a logged user' do
    let(:user) { create(:user) }

    scenario 'with valid informations' do
      visit root_path(as: user)

      click_link I18n.t('vacancies.index.advertise_message')

      fill_in I18n.t('vacancies.form.job_title'),    with: 'Stormtrooper'
      fill_in I18n.t('vacancies.form.location'),     with: 'Death Star'
      fill_in I18n.t('vacancies.form.description'),
              with: 'You will handle the security of the Death Star. You do not need to be a good shooter'
      fill_in I18n.t('vacancies.form.how_to_apply'),
              with: 'Send an email to hr@theempire.com with your CV and a cover letter.'

      click_button I18n.t('helpers.submit.vacancy.create')

      expect(page).to have_text I18n.t('vacancies.create.success')
      expect(page).to have_text 'Stormtrooper'
      expect(page).to have_text user.company.name
      expect(page).to have_text user.company.url
    end

    scenario 'with invalid informations' do
      visit root_path(as: user)

      click_link I18n.t('vacancies.index.advertise_message')

      click_button I18n.t('helpers.submit.vacancy.create')

      expect(page).not_to have_text I18n.t('vacancies.create.success')
    end
  end

  scenario 'without a logged user' do
    visit root_path

    click_link I18n.t('vacancies.index.advertise_message')

    expect(page).to have_text I18n.t('flashes.failure_when_not_signed_in')
  end
end
