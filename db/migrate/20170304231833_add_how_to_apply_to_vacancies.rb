# frozen_string_literal: true

class AddHowToApplyToVacancies < ActiveRecord::Migration[5.1]
  def change
    add_column :vacancies, :how_to_apply, :text, null: false, default: ''
    change_column :vacancies, :how_to_apply, :text, default: nil
  end
end
