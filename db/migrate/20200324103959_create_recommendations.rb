class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :rating
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
