class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.references :user, null: false, foreign_key: true
      t.references :island, null: false, foreign_key: true

      t.timestamps
    end
  end
end
