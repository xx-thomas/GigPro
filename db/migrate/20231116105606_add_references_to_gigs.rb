class AddReferencesToGigs < ActiveRecord::Migration[7.1]
  def change
		add_column(:gigs, :customer_id, :integer, null: false)
		add_column(:gigs, :worker_id, :integer, null: true)
		add_column(:users, :worker_rating, :integer, default: 0, null: false)
		add_column(:users, :balance, :decimal, default: 0, null: false)
  end
end
