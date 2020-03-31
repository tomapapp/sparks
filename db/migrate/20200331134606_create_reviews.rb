class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.references :datenight, foreign_key: true
      t.text :content
      t.integer :date_rating

      t.timestamps
    end
  end
end
