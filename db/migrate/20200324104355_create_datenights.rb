class CreateDatenights < ActiveRecord::Migration[5.2]
  def change
    create_table :datenights do |t|
      t.datetime :time
      t.references :recommendation, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
