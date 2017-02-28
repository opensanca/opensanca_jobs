require "rails_helper"

RSpec.feature "User register a Vacancy" do
  scenario "with valid informations" do
    visit root_path

    click_link I18n.t("vacancies.index.post_vacancy")

    fill_in I18n.t("vacancies.new.job_title"),   with: "Stormtrooper"
    fill_in I18n.t("vacancies.new.location"),    with: "Death Star"
    fill_in I18n.t("vacancies.new.description"), with: "You will handle the security of the Death Star. You do not need to be a good shooter"

    within("#company-details") do
      fill_in "Name",   with: "The Empire"
      fill_in "URL",    with: "www.theempire.com"
      fill_in "E-mail", with: "hr@theempire.com"
    end

    click_button "Post vacancy"

    expect(page).to have_text I18n.t("vacancies.create.success")
  end

  scenario "with invalid informations" do
    visit root_path

    click_link I18n.t("vacancies.index.post_vacancy")

    click_button "Post vacancy"

    expect(page).not_to have_text I18n.t("vacancies.create.success")
  end
end
