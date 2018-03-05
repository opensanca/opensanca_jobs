class RemoveCompanyFieldsFromVacancies < ActiveRecord::Migration[5.1]
  def change
    remove_column :vacancies, :company_name, :string
    remove_column :vacancies, :company_url, :string
    remove_column :vacancies, :company_email, :string

    reversible do |dir|
      execute <<-SQL
        DROP TRIGGER vacancies_tsvectorupdate
        ON vacancies
      SQL

      dir.up do
        execute <<-SQL
          CREATE TRIGGER vacancies_tsvectorupdate BEFORE INSERT OR UPDATE
          ON vacancies FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(
            tsv, 'pg_catalog.portuguese', location, job_title, description
          );
        SQL
      end

      dir.down do
        execute <<-SQL
          CREATE TRIGGER vacancies_tsvectorupdate BEFORE INSERT OR UPDATE
          ON vacancies FOR EACH ROW EXECUTE PROCEDURE
          tsvector_update_trigger(
            tsv, 'pg_catalog.portuguese', location, company_name, job_title, description
          );
        SQL
      end
    end
  end
end
