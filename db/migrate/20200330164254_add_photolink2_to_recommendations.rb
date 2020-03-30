class AddPhotolink2ToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :photolink_2, :string
  end
end
