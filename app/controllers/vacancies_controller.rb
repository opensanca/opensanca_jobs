# frozen_string_literal: true

class VacanciesController < ApplicationController
  before_action :require_login, except: %i[index show]

  rescue_from ActiveRecord::RecordInvalid, with: :render_new

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
