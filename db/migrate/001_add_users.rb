class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :group_id
      t.string :password
      t.timestamps
    end
  end
end
