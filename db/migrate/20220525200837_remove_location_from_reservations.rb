class RemoveLocationFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :location, :string
  end
end
