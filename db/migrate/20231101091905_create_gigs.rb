class CreateGigs < ActiveRecord::Migration[7.1]
  def change
    create_table :gigs do |t|
      t.string :title
      t.string :description
      t.string :location
      t.decimal :payment
      t.datetime :deadline
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
