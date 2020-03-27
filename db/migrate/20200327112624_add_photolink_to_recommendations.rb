class AddPhotolinkToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :photolink, :string
  end
end
