class CreateLetters < ActiveRecord::Migration[5.0]
  def change
    create_table :letters do |t|
      t.string :sender
      t.string :receiver
      t.text :content
      t.string :state
      t.string :authority

      t.timestamps
    end
  end
end
