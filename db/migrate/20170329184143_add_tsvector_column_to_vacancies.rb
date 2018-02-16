# frozen_string_literal: true

class AddTsvectorColumnToVacancies < ActiveRecord::Migration[5.1]
  def up
    add_column :vacancies, :tsv, :tsvector
    add_index :vacancies, :tsv, using: 'gin'

    execute <<-SQL
      CREATE TRIGGER vacancies_tsvectorupdate BEFORE INSERT OR UPDATE
      ON vacancies FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv, 'pg_catalog.portuguese', location, company_name, job_title, description
      );
    SQL

    now = Time.current.to_s(:db)
    update("UPDATE vacancies SET updated_at = '#{now}'")
  end

  def down
    execute <<-SQL
      DROP TRIGGER vacancies_tsvectorupdate
      ON vacancies
    SQL

    remove_index :vacancies, :tsv
    remove_column :vacancies, :tsv
  end
end
