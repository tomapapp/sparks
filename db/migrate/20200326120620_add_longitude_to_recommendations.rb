class AddLongitudeToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :longitude, :float
  end
end
