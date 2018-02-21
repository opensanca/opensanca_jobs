class AddTsvectorColumnToCompanies < ActiveRecord::Migration[5.1]
  def up
    add_column :companies, :company_tsv, :tsvector
    add_index :companies, :company_tsv, using: 'gin'

    execute <<-SQL
      CREATE TRIGGER companies_tsvectorupdate BEFORE INSERT OR UPDATE
      ON companies FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        company_tsv, 'pg_catalog.portuguese', name
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE companies SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER companies_tsvectorupdate
      ON companies
    SQL

    remove_index :companies, :company_tsv
    remove_column :companies, :company_tsv
  end
end
