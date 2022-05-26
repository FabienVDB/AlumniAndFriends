class RemoveDurationFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :duration, :integer
  end
end
