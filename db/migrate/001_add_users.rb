class AddUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :group_id
      t.string :password
      t.timestamps
    end
  end
end
