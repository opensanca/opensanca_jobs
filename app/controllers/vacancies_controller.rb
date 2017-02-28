class VacanciesController < ApplicationController
  def index
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      flash[:success] = t(".success")
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:job_title, :location, :description, :company_name, :company_url, :company_email)
  end
end
