class AddPasswordDigestToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests, :password_digest, :string
  end
end
