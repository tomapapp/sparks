class AddPhotolink3ToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :photolink_3, :string
  end
end
