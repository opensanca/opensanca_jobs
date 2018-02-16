# frozen_string_literal: true

class CreateVacancies < ActiveRecord::Migration[5.0]
  def change
    create_table :vacancies do |t|
      t.string :job_title
      t.string :location
      t.text :description
      t.string :company_name
      t.string :company_url
      t.string :company_email

      t.timestamps
    end

    add_index :vacancies, :location
    add_index :vacancies, :company_email
    add_index :vacancies, :company_url
  end
end
