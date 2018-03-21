class Company
  class VacanciesController < ApplicationController
    before_action :require_login

    def index
      @vacancies = current_company.vacancies
    end
  end
end
