require 'rails_helper'

RSpec.feature 'Register Vacancy' do
  describe 'with valid informations' do
    it 'creates the vacancy on the database' do
      visit '/vacancies/new'

      fill_in 'Job title',   with: 'Stormtrooper'
      fill_in 'Location',    with: 'Death Star'
      fill_in 'Description', with: 'You will handle the security of the Death Star. You do not need to be a good shooter'

      within('#company-details') do
        fill_in 'Name',   with: 'The Empire'
        fill_in 'URL',    with: 'www.theempire.com'
        fill_in 'E-mail', with: 'hr@theempire.com'
      end

      click_button 'Post vacancy'
    end
  end
end
