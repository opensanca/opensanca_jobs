# frozen_string_literal: true

require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |_i|
  company = Company.create!(name: Faker::Company.name,
                            url: Faker::Internet.url)

  User.create!(email: Faker::Internet.email(company.name),
               password: Faker::Internet.password,
               company: company)

  Vacancy.create!(job_title: Faker::Company.profession,
                  location: Faker::Address.city,
                  description: Faker::Hipster.sentence,
                  how_to_apply: Faker::Hipster.sentence,
                  company: company)
end
