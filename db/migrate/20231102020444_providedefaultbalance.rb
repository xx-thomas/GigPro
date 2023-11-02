class Providedefaultbalance < ActiveRecord::Migration[7.1]
  def change
		change_column_default(:customers, :balance, 0)
		change_column_default(:workers, :balance, 0)
  end
end
