class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.string :short_desc
      t.text :text
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
