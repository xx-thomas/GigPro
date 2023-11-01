class Allowmissingcustomer < ActiveRecord::Migration[7.1]
  def change
	change_column_null(:gigs, :customer_id, true)
  end
end
