class AddObservationsToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :observations, :text
  end
end
