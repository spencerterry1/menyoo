class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :checkout_session_id
      t.references :attendee, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
