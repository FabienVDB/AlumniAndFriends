class RemoveRewardFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :reward, :string
  end
end
