# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Registration', type: :feature do
  scenario 'user registration and sign in' do
    visit root_path

    click_on 'Advertise for free'
    click_on 'Sign up'

    fill_in placeholder: 'E-mail',   with: 'vader@galacticempire.com'
    fill_in placeholder: 'Password', with: 'deathstar'

    fill_in placeholder: 'Company name',    with: 'Galactic Empire'
    fill_in placeholder: 'Company website', with: 'http://galacticempire.com'

    click_on 'Sign up'

    expect(page).to have_text 'Submit your vacancy'
    expect(page).to have_text 'Logout'

    # Try to login with the same informations

    click_on 'Logout'

    expect(page).to have_text 'Sign in'

    fill_in placeholder: 'E-mail',   with: 'vader@galacticempire.com'
    fill_in placeholder: 'Password', with: 'deathstar'

    click_on 'Sign in'

    expect(page).to have_text 'Logout'
  end

  scenario 'registering with an existing email' do
    create(:user, email: 'vader@galacticempire.com')

    visit root_path

    click_on 'Advertise for free'
    click_on 'Sign up'

    fill_in placeholder: 'E-mail',   with: 'vader@galacticempire.com'
    fill_in placeholder: 'Password', with: 'deathstar'

    fill_in placeholder: 'Company name',    with: 'Galactic Empire'
    fill_in placeholder: 'Company website', with: 'http://galacticempire.com'

    click_on 'Sign up'

    expect(page).to have_text 'E-mail has already been taken'
  end
end
