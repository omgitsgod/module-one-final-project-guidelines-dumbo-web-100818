class AddNotes < ActiveRecord::Migration[4.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :subject_id
      t.boolean :bookmark
      t.timestamps
    end
  end
end
