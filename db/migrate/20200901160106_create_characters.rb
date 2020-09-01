class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :house
      t.string :role
      t.string :patronus
      t.timestamps
    end
  end
end
