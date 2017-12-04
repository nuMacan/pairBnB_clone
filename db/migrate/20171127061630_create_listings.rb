class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :listing_name
      t.string :listing_type
      t.integer :number_of_rooms
      t.string :city
      t.string :price
      t.boolean :wifi
      t.boolean :smoking_room
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
