require "rails_helper"

RSpec.feature "Visit a vacancy page", type: :feature do
  scenario "show the vacancy information" do
    vacancy = create(:vacancy)

    visit root_path

    click_link "Apply for job"

    expect(current_path).to eql(vacancy_path(vacancy))

    expect(page).to have_content(vacancy.job_title)
    expect(page).to have_content(vacancy.company_name)
    expect(page).to have_content(vacancy.location)
    expect(page).to have_content(vacancy.description)
  end
end
