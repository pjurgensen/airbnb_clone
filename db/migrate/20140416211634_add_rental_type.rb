class AddRentalType < ActiveRecord::Migration
  def change
    add_column :rentals, :type, :string
  end
end
