class AddPricetoRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :price, :integer
  end
end
