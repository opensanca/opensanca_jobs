# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    add_column :vacancies, :company_id, :integer
    add_index  :vacancies, :company_id
  end
end
