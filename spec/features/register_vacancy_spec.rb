# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User register a Vacancy' do
  scenario 'with valid informations' do
    visit root_path

    click_link I18n.t('vacancies.index.advertise_message')

    fill_in I18n.t('vacancies.new.job_title'),    with: 'Stormtrooper'
    fill_in I18n.t('vacancies.new.location'),     with: 'Death Star'
    fill_in I18n.t('vacancies.new.description'),
            with: 'You will handle the security of the Death Star. You do not need to be a good shooter'
    fill_in I18n.t('vacancies.new.how_to_apply'),
            with: 'Send an email to hr@theempire.com with your CV and a cover letter.'

    within('#company-details') do
      fill_in I18n.t('vacancies.new.company_name'),   with: 'The Empire'
      fill_in I18n.t('vacancies.new.company_url'),    with: 'www.theempire.com'
      fill_in I18n.t('vacancies.new.company_email'),  with: 'hr@theempire.com'
    end

    click_button I18n.t('helpers.submit.vacancy.create')

    expect(page).to have_text I18n.t('vacancies.create.success')
    expect(page).to have_text 'Stormtrooper'
  end

  scenario 'with invalid informations' do
    visit root_path

    click_link I18n.t('vacancies.index.advertise_message')

    click_button I18n.t('helpers.submit.vacancy.create')

    expect(page).not_to have_text I18n.t('vacancies.create.success')
  end
end
