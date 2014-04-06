class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :username,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :salt

      t.timestamps
    end

  end
end
