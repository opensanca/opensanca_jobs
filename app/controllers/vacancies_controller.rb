class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.search params[:search]
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      flash[:success] = t(".success")
      redirect_to @vacancy
    else
      render :new
    end
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:job_title, :location, :description, :how_to_apply, :company_name, :company_url,
                                    :company_email)
  end
end
