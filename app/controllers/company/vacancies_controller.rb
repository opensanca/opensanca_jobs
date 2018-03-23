# frozen_string_literal: true

class Company::VacanciesController < ApplicationController # rubocop:disable Style/ClassAndModuleChildren
  before_action :require_login

  def index
    @vacancies = current_company.vacancies
  end
end
