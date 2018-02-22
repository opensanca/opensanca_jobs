# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  belongs_to :company

  accepts_nested_attributes_for :company

  delegate :name, to: :company, prefix: true
end
