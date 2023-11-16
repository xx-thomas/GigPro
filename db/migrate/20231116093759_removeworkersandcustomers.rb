class Removeworkersandcustomers < ActiveRecord::Migration[7.1]
  def change
		remove_index :gigs, name: "index_gigs_on_customer_id"
		remove_index :gigs, name: "index_gigs_on_worker_id"
		remove_column :gigs, :customer_id
		remove_column :gigs, :worker_id
		drop_table :customers
		drop_table :workers
  end
end
