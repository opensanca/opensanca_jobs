# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Edit vacancy', type: :feature do
  context 'with a logged user' do
    let(:user) { create(:user) }

    scenario 'edit vacancy from my list' do
      zoo_keeper = create(:vacancy, job_title: 'ZooKeeper', company_id: user.company.id)
      visit company_vacancies_path(as: user)

      click_link I18n.t('messages.edit_vacancy'), href: edit_vacancy_path(zoo_keeper.id)

      expect(current_path).to eql(edit_vacancy_path(zoo_keeper.id))
      expect(page).to have_content(I18n.t('vacancies.edit.edit_vacancies'), wait: 10)

      fill_in I18n.t('vacancies.edit.job_title'),    with: 'Bad ZooKeeper'
      fill_in I18n.t('vacancies.edit.location'),     with: 'Central Zoo'
      fill_in I18n.t('vacancies.edit.description'),  with: 'clear the lyon poo.'
      fill_in I18n.t('vacancies.edit.how_to_apply'), with: 'Send an email.'

      click_button I18n.t('helpers.submit.vacancy.update')

      expect(page).to have_text 'Bad ZooKeeper'
      expect(page).to have_text 'Central Zoo'

    end

    scenario 'edit vacancy from another user' do
      rebels_company = create(:company, name: 'Rebels Co.', url: 'http://rebels.com')
      luke = create(:user, email: 'luke@rebels.com', password: 'force', company: rebels_company)
      not_my_vacancy = create(:vacancy, company_id: luke.company.id)

      visit company_vacancies_path(as: user)
      visit edit_vacancy_path(not_my_vacancy.id)

      expect(current_path).to eql(company_vacancies_path)
      expect(page).to have_text I18n.t('vacancies.edit.dont_belongs_to_you')
    end
  end
end
