class AddLatitudeToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :latitude, :float
  end
end
