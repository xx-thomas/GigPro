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

ActiveRecord::Schema[7.1].define(version: 2023_11_02_020444) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance", default: "0.0"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.decimal "payment"
    t.datetime "deadline"
    t.integer "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "worker_id"
    t.index ["customer_id"], name: "index_gigs_on_customer_id"
    t.index ["worker_id"], name: "index_gigs_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "number"
    t.string "language_preference"
    t.decimal "rating", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "balance", default: "0.0"
  end

  add_foreign_key "gigs", "customers"
  add_foreign_key "gigs", "workers"
end
