class AddRatingValueToRatings < ActiveRecord::Migration[7.1]
  def change
    add_column :ratings, :rating_value, :integer
  end
end
