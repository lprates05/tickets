class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.float :price
      t.string :ticket_restrictions
      t.string :ticket_photo
      t.integer :seller_id
      t.integer :buyer_id
      t.string :status

      t.timestamps
    end
  end
end
