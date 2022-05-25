class RemoveDescriptionFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :description, :text
  end
end
