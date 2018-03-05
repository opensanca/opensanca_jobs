# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :require_login, except: %i[index show]
  before_action :validate_ownership, only: %i[edit]

  rescue_from ActiveRecord::RecordInvalid, with: :render_new
  rescue_from VacancyDontBelongsToUser, with: :render_bad_ownership

  def index
    @search = params[:search]
    @vacancies = Searchs::Vacancy.list(@search)
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
    @vacancy
  end

  def update
    @vacancy = Vacancy.friendly.find(params[:id])
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

  def validate_ownership
    @vacancy = Vacancy.friendly.find(params[:id])
    raise VacancyDontBelongsToUser if @vacancy.company != current_company
  end

  def render_bad_ownership
    flash[:error] = t('vacancies.edit.dont_belongs_to_you')
    redirect_to company_vacancies_path
  end

end
