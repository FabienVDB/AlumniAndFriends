class AddAlumniToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :alumni, :boolean
  end
end
