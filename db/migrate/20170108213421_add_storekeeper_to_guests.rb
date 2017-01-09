class AddStorekeeperToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :storekeeper, :boolean
  end
end
