class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendees do |t|
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true
      t.boolean :accepted
      t.boolean :payment

      t.timestamps
    end
  end
end
