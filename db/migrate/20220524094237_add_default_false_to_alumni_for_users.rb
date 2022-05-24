class AddDefaultFalseToAlumniForUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :alumni, from: nil, to: false
  end
end
