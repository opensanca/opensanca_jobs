# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180221233924) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.tsvector "company_tsv"
    t.index ["company_tsv"], name: "index_companies_on_company_tsv", using: :gin
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.integer "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  create_table "vacancies", id: :serial, force: :cascade do |t|
    t.string "job_title"
    t.string "location"
    t.text "description"
    t.string "company_name"
    t.string "company_url"
    t.string "company_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "how_to_apply", null: false
    t.string "slug"
    t.tsvector "tsv"
    t.integer "company_id"
    t.index ["company_email"], name: "index_vacancies_on_company_email"
    t.index ["company_id"], name: "index_vacancies_on_company_id"
    t.index ["company_url"], name: "index_vacancies_on_company_url"
    t.index ["location"], name: "index_vacancies_on_location"
    t.index ["slug"], name: "index_vacancies_on_slug", unique: true
    t.index ["tsv"], name: "index_vacancies_on_tsv", using: :gin
  end

end
