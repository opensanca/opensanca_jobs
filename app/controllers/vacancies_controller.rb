class VacanciesController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_new

  def index
    @search = params[:search]
    @vacancies = Searchs::Vacancy.list(@search)
  end

  def new
    raise 'testing'
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    Vacancy::Publish.new.publish(@vacancy)
    flash[:success] = t(".success")
    redirect_to @vacancy
  end

  def show
    @vacancy = Vacancy.friendly.find(params[:id])
  end

  private

  def render_new
    render :new
  end

  def vacancy_params
    params.require(:vacancy).permit(:job_title, :location, :description, :how_to_apply, :company_name, :company_url,
                                    :company_email)
  end
end
