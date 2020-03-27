class AddReviewcountToRecommendations < ActiveRecord::Migration[5.2]
  def change
    add_column :recommendations, :reviewcount, :integer
  end
end
