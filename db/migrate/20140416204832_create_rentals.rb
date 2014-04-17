class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :title
      t.string :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.belongs_to :user

      t.timestamps
    end
  end
end
