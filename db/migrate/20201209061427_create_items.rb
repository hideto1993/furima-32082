class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,                      null: false
      t.integer :category_id,               null: false
      t.integer :status_id,                 null: false
      t.integer :price,                     null: false
      t.integer :burden_fee_id,             null: false
      t.integer :prefecture_id,             null: false
      t.integer :shipping_date_and_time_id, null: false
      t.text :explanation,                  null: false
      t.references :user,                   foreign_key: true
      t.timestamps
    end
  end
end
