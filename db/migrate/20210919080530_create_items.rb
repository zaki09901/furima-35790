class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.text :product_description   , null: false
      t.string :product_name   , null: false
      t.integer :product_status_id   , null: false
      t.integer :load_id   , null: false
      t.integer :selling_price   , null: false
      t.integer :ship_id   , null: false
      t.integer :prefecture_id   , null: false
      t.integer :category_id   , null: false
      t.references :user   , null: false, foreign_key: true



      t.timestamps
    end
  end
end
