# frozen_string_literal: true

FactoryGirl.define do
  factory :vacancy do
    job_title    { Faker::Company.profession }
    location     { Faker::Address.city }
    description  { Faker::Hipster.sentence }
    how_to_apply { Faker::Hipster.sentence }
    company
  end
end
