class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :section
      t.text :text
      t.string :image_file

      t.timestamps
    end
  end
end
