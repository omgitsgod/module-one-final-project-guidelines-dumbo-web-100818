class AddGroups < ActiveRecord::Migration[4.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end
  end
end
