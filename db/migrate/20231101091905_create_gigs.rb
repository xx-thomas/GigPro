class CreateGigs < ActiveRecord::Migration[7.1]
  def change
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
  end
end
