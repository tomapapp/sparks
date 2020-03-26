class ChangeRatingToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :recommendations, :rating, :float
  end
end
