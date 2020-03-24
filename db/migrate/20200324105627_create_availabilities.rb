class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :time
      t.references :recommendation, foreign_key: true

      t.timestamps
    end
  end
end
