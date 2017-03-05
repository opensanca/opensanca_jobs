FactoryGirl.define do
  factory :vacancy do
    job_title    { Faker::Company.profession }
    location     { Faker::Address.city }
    description  { Faker::Hipster.sentence }
    how_to_apply { Faker::Hipster.sentence }

    company_name  { Faker::Company.name }
    company_url   { Faker::Internet.url }
    company_email { Faker::Internet.email }
  end
end
