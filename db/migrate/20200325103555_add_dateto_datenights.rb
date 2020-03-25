class AddDatetoDatenights < ActiveRecord::Migration[5.2]
  def change
    add_column :datenights, :day_of_date, :datetime
  end
end
