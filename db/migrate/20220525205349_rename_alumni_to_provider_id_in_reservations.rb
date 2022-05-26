class RenameAlumniToProviderIdInReservations < ActiveRecord::Migration[6.1]
  def change
    rename_column :reservations, :alumni_id, :provider_id
  end
end
