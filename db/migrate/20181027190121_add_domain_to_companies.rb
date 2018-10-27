class AddDomainToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :domain, :string
    add_index :companies, :domain
  end
end
