class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :category
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :timezone
      t.string :event_photo

      t.timestamps
    end
  end
end
