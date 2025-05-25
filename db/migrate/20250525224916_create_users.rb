class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :profile_photo
      t.integer :class_year
      t.text :bio
      t.integer :listings_count

      t.timestamps
    end
  end
end
