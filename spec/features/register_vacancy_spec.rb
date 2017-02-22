require 'rails_helper'

RSpec.feature 'Register Vacancy' do
  describe 'with valid informations' do
    it 'creates the vacancy on the database' do
      visit '/vacancies/new'

      fill_in 'Job title',   with: 'Stormtrooper'
      fill_in 'Location',    with: 'Death Star'
      fill_in 'Description', with: 'You will handle the security of the Death Star. You do not need to bee a good shooter'

      fill_in 'Company name', with: 'The Empire'
      fill_in 'URL',          with: 'www.theempire.com'
      fill_in 'Email',        with: 'hr@theempire.com'

      click_button 'Post job'
    end
  end
end
