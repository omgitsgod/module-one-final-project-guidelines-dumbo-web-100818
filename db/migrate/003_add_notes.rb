class AddNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :subject_id
      t.boolean :bookmark
      t.timestamps
    end
  end
end
