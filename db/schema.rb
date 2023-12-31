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

ActiveRecord::Schema[7.1].define(version: 2023_12_04_193639) do
  create_table "gigs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "location"
    t.decimal "payment"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.integer "worker_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.boolean "read"
    t.string "notification_type"
    t.integer "user_id", null: false
    t.integer "gig_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gig_id"], name: "index_notifications_on_gig_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "worker_rating", default: 0, null: false
    t.decimal "balance", default: "0.0", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "notifications", "gigs"
  add_foreign_key "notifications", "users"
end
