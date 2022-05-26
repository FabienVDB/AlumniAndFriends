class RenameUserIdToCliendIdInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :user_id, :client_id
  end
end
