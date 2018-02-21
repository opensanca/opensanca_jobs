# frozen_string_literal: true

class Company < ApplicationRecord
  URL_REGEX = /\A^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$\Z/ix

  has_many :users
  has_many :vacancies

  validates :name, :url, presence: true
  validates :url, format: { with: URL_REGEX }

  before_validation do
    self.url = "http://#{url}" unless url.nil? || url[0, 4] == 'http'
  end
end
