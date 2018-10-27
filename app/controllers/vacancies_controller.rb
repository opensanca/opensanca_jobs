# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :require_login, except: %i[index show]

  rescue_from ActiveRecord::RecordInvalid, with: :render_new

  def index
    @search = params[:search]
    @vacancies = Searchs::Vacancy.list(@search)
    @filtered_by = {
      name: 'Projeto Dumont',
      domain: 'https://getdumont.com',
      description: 'Projeto Social dedicado à saúde mental. Criado de uma pesquisa sobre depressão, ansiedade e estresse, seu foco é aumentar visibilidade do assunto no Brasil.',
      background: 'https://raw.githubusercontent.com/getdumont/getdumont.github.io/master/assets/images/banner.png',
      logo: 'https://getdumont.com/assets/images/icons/apple-icon-180x180.png'
    }
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = current_company.vacancies.new(vacancy_params)
    Vacancy::Publish.new.publish(@vacancy)
    flash[:success] = t('.success')
    redirect_to @vacancy
  end

  def show
    @vacancy = Vacancy.friendly.find(params[:id])
  end

  def edit
    @vacancy = current_company.vacancies.friendly.find(params[:id])
  end

  def update
    @vacancy = current_company.vacancies.friendly.find(params[:id])
    @vacancy.update_attributes!(vacancy_params)
    redirect_to @vacancy
  end

  private

  def render_new
    render :new
  end

  def vacancy_params
    params.require(:vacancy).permit(:job_title, :location, :description, :how_to_apply)
  end
end
