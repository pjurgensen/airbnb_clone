class DropRentalDates < ActiveRecord::Migration
  def change
    remove_column :rentals, :start_date
    remove_column :rentals, :end_date
  end
end
