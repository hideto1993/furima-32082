class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.integer :prefecture_id,               null: false
      t.string :municipalities,               null: false
      t.string :address,                      null: false
      t.string :building_number,
      t.string :postal_code,                  null: false
      t.string :phone_number,                 null: false
      t.references :purchase,                 foreign_key: true
      t.timestamps
    end
  end
end
