# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_13_185114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company"
    t.date "date_of_birth"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.string "occupation"
    t.integer "entity_type"
    t.date "tax_year_ends"
    t.integer "filing_status"
    t.integer "number_of_dependents"
    t.string "spouse_first_name"
    t.string "spouse_last_name"
    t.date "spouse_date_of_birth"
    t.string "spouse_phone"
    t.string "spouse_email"
    t.string "spouse_occupation"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "primary_preparer_id"
    t.integer "tax_id"
    t.boolean "discontinue", default: false
    t.index ["primary_preparer_id"], name: "index_clients_on_primary_preparer_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "fed_form"
    t.string "primary_state"
    t.string "second_state"
    t.string "third_state"
    t.boolean "tmse"
    t.boolean "portland"
    t.integer "status"
    t.boolean "printed"
    t.boolean "scanned"
    t.boolean "uploaded"
    t.date "filed"
    t.date "ack_fed"
    t.date "ack_primary_state"
    t.date "ack_second_state"
    t.date "ack_third_state"
    t.date "due_date"
    t.string "rejected"
    t.text "notes"
    t.bigint "client_id"
    t.bigint "preparer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "job_type"
    t.float "bill", default: 0.0
    t.boolean "final_efile_check", default: false
    t.boolean "paid_in_full", default: false, null: false
    t.integer "year"
    t.index ["client_id"], name: "index_jobs_on_client_id"
    t.index ["preparer_id"], name: "index_jobs_on_preparer_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.integer "payment_type"
    t.integer "check_number"
    t.bigint "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "partial_payment", default: false
    t.index ["job_id"], name: "index_payments_on_job_id"
  end

  create_table "preparers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.string "street"
    t.string "city"
    t.string "state"
    t.integer "zip_code"
    t.date "date_of_birth"
    t.string "license_number"
    t.string "job_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.text "bio"
    t.string "image_url"
    t.index ["user_id"], name: "index_preparers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "role"
    t.bigint "preparer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["preparer_id"], name: "index_users_on_preparer_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wages", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "preparer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "pay_date"
    t.index ["preparer_id"], name: "index_wages_on_preparer_id"
  end

  add_foreign_key "clients", "preparers", column: "primary_preparer_id"
  add_foreign_key "jobs", "clients"
  add_foreign_key "jobs", "preparers"
  add_foreign_key "payments", "jobs"
  add_foreign_key "preparers", "users"
  add_foreign_key "users", "preparers"
  add_foreign_key "wages", "preparers"
end
