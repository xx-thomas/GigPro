class CreateWorkers < ActiveRecord::Migration[7.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :location
      t.string :number
      t.string :language_preference
      t.decimal :rating

      t.timestamps
    end
  end
end
