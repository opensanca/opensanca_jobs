# frozen_string_literal: true

class AddSlugToVacancies < ActiveRecord::Migration[5.1]
  def change
    add_column :vacancies, :slug, :string
    add_index :vacancies, :slug, unique: true
  end
end
