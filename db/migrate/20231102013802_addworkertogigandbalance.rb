class Addworkertogigandbalance < ActiveRecord::Migration[7.1]
  def change
		add_reference :gigs, :worker, foreign_key: true, null: true
		add_column :customers, :balance, :decimal
		add_column :workers, :balance, :decimal
  end
end
