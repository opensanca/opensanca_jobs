# frozen_string_literal: true

class SetupFirstAccounts < ActiveRecord::Migration[5.1]
  class Vacancy < ApplicationRecord
    belongs_to :company
  end

  def change
    reversible do |dir|
      dir.up do
        Vacancy.find_each do |vacancy|
          user = User.create_with(
            password: SecureRandom.hex(8),
            company_attributes: {
              name: vacancy.company_name,
              url:  vacancy.company_url
            }
          ).find_or_create_by!(email: vacancy.company_email)

          vacancy.company = user.company
          vacancy.save!
        end

        # Deliver the welcome email
        User.find_each { |user| WelcomeUserWorker.perform_async(user.id) }
      end

      dir.down do
        [Company, User].each(&:delete_all)
        Vacancy.find_each { |vacancy| vacancy.update_attributes(company_id: nil) }
      end
    end
  end
end
