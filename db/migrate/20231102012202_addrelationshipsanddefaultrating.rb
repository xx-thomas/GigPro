class Addrelationshipsanddefaultrating < ActiveRecord::Migration[7.1]
  def change
		change_column_null(:gigs, :customer_id, false)
		change_column_default(:workers, :rating, 0)
  end
end
