class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :user
      t.belongs_to :rental
      t.date :start_date
      t.date :end_date
    end
  end
end
