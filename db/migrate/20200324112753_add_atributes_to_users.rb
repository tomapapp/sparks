class AddAtributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :secondary_email, :string
    add_column :users, :location, :string
    add_column :users, :date_frequency, :integer
  end
end
