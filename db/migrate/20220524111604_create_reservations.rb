class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :alumni_id
      t.text :description
      t.string :location
      t.date :date
      t.integer :duration
      t.string :reward

      t.timestamps
    end
  end
end
