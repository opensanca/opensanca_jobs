class VacanciesController < ApplicationController
  def index
  end

  def new
    @vacancy = Vacancy.new
  end
end
