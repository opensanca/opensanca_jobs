# frozen_string_literal: true

class AddCompanyIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :company_id, :integer
    add_index :users, :company_id
  end
end
