# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    email 'vader@theempire.com'
    password 'deathstar'
    company
  end
end
