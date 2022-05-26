class AddrewardToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :reward, :string
  end
end
