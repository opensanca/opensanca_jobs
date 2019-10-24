# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Signing in with a Banned User' do
  scenario 'does not allow banned user to sign in' do
    create(:user, email: 'banned@user.com', password: 'password', banned: true)

    visit sign_in_path

    fill_in 'E-mail',   with: 'banned@user.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign in'

    expect(page).to have_text 'Your user is banned.'
  end

  scenario 'allows unbanned user to sign in' do
    create(:user, email: 'unbanned@user.com', password: 'password', banned: false)

    visit sign_in_path

    fill_in 'E-mail',   with: 'unbanned@user.com'
    fill_in 'Password', with: 'password'

    click_button 'Sign in'

    expect(page).not_to have_text 'Your user is banned.'
  end
end
