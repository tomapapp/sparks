class AddPhotolink4ToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :photolink_4, :string
  end
end
