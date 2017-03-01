require "rails_helper"

RSpec.feature "Visit index page", type: :feature do
  scenario "lists all vacancies in the index page" do
    vacancy1, vacancy2, vacancy3 = create_list(:vacancy, 3)

    visit root_path

    expect(page).to have_content(I18n.t("vacancies.index.title"))

    # Displays all vacancies
    expect(page).to have_content(vacancy1.job_title)
    expect(page).to have_content(vacancy2.job_title)
    expect(page).to have_content(vacancy3.job_title)
  end
end
